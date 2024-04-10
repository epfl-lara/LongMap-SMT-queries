; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82724 () Bool)

(assert start!82724)

(declare-fun b_free!18857 () Bool)

(declare-fun b_next!18857 () Bool)

(assert (=> start!82724 (= b_free!18857 (not b_next!18857))))

(declare-fun tp!65691 () Bool)

(declare-fun b_and!30345 () Bool)

(assert (=> start!82724 (= tp!65691 b_and!30345)))

(declare-fun b!964784 () Bool)

(declare-fun e!543883 () Bool)

(declare-fun tp_is_empty!21659 () Bool)

(assert (=> b!964784 (= e!543883 tp_is_empty!21659)))

(declare-fun res!645796 () Bool)

(declare-fun e!543884 () Bool)

(assert (=> start!82724 (=> (not res!645796) (not e!543884))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82724 (= res!645796 (validMask!0 mask!2110))))

(assert (=> start!82724 e!543884))

(assert (=> start!82724 true))

(declare-datatypes ((V!33861 0))(
  ( (V!33862 (val!10880 Int)) )
))
(declare-datatypes ((ValueCell!10348 0))(
  ( (ValueCellFull!10348 (v!13438 V!33861)) (EmptyCell!10348) )
))
(declare-datatypes ((array!59405 0))(
  ( (array!59406 (arr!28571 (Array (_ BitVec 32) ValueCell!10348)) (size!29050 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59405)

(declare-fun e!543885 () Bool)

(declare-fun array_inv!22121 (array!59405) Bool)

(assert (=> start!82724 (and (array_inv!22121 _values!1400) e!543885)))

(declare-datatypes ((array!59407 0))(
  ( (array!59408 (arr!28572 (Array (_ BitVec 32) (_ BitVec 64))) (size!29051 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59407)

(declare-fun array_inv!22122 (array!59407) Bool)

(assert (=> start!82724 (array_inv!22122 _keys!1686)))

(assert (=> start!82724 tp!65691))

(assert (=> start!82724 tp_is_empty!21659))

(declare-fun b!964785 () Bool)

(declare-fun e!543882 () Bool)

(assert (=> b!964785 (= e!543884 (not e!543882))))

(declare-fun res!645794 () Bool)

(assert (=> b!964785 (=> res!645794 e!543882)))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964785 (= res!645794 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29051 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33861)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33861)

(declare-datatypes ((tuple2!13986 0))(
  ( (tuple2!13987 (_1!7004 (_ BitVec 64)) (_2!7004 V!33861)) )
))
(declare-datatypes ((List!19831 0))(
  ( (Nil!19828) (Cons!19827 (h!20989 tuple2!13986) (t!28194 List!19831)) )
))
(declare-datatypes ((ListLongMap!12683 0))(
  ( (ListLongMap!12684 (toList!6357 List!19831)) )
))
(declare-fun contains!5460 (ListLongMap!12683 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3590 (array!59407 array!59405 (_ BitVec 32) (_ BitVec 32) V!33861 V!33861 (_ BitVec 32) Int) ListLongMap!12683)

(assert (=> b!964785 (contains!5460 (getCurrentListMap!3590 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28572 _keys!1686) i!803))))

(declare-datatypes ((Unit!32295 0))(
  ( (Unit!32296) )
))
(declare-fun lt!431160 () Unit!32295)

(declare-fun lemmaInListMapFromThenInFromMinusOne!42 (array!59407 array!59405 (_ BitVec 32) (_ BitVec 32) V!33861 V!33861 (_ BitVec 32) (_ BitVec 32) Int) Unit!32295)

(assert (=> b!964785 (= lt!431160 (lemmaInListMapFromThenInFromMinusOne!42 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964786 () Bool)

(declare-fun res!645792 () Bool)

(assert (=> b!964786 (=> (not res!645792) (not e!543884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59407 (_ BitVec 32)) Bool)

(assert (=> b!964786 (= res!645792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964787 () Bool)

(assert (=> b!964787 (= e!543882 true)))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964787 (contains!5460 (getCurrentListMap!3590 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28572 _keys!1686) i!803))))

(declare-fun lt!431161 () Unit!32295)

(declare-fun lemmaInListMapFromThenInFromSmaller!37 (array!59407 array!59405 (_ BitVec 32) (_ BitVec 32) V!33861 V!33861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32295)

(assert (=> b!964787 (= lt!431161 (lemmaInListMapFromThenInFromSmaller!37 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34483 () Bool)

(declare-fun mapRes!34483 () Bool)

(declare-fun tp!65690 () Bool)

(assert (=> mapNonEmpty!34483 (= mapRes!34483 (and tp!65690 e!543883))))

(declare-fun mapRest!34483 () (Array (_ BitVec 32) ValueCell!10348))

(declare-fun mapValue!34483 () ValueCell!10348)

(declare-fun mapKey!34483 () (_ BitVec 32))

(assert (=> mapNonEmpty!34483 (= (arr!28571 _values!1400) (store mapRest!34483 mapKey!34483 mapValue!34483))))

(declare-fun mapIsEmpty!34483 () Bool)

(assert (=> mapIsEmpty!34483 mapRes!34483))

(declare-fun b!964788 () Bool)

(declare-fun e!543887 () Bool)

(assert (=> b!964788 (= e!543887 tp_is_empty!21659)))

(declare-fun b!964789 () Bool)

(declare-fun res!645793 () Bool)

(assert (=> b!964789 (=> (not res!645793) (not e!543884))))

(declare-datatypes ((List!19832 0))(
  ( (Nil!19829) (Cons!19828 (h!20990 (_ BitVec 64)) (t!28195 List!19832)) )
))
(declare-fun arrayNoDuplicates!0 (array!59407 (_ BitVec 32) List!19832) Bool)

(assert (=> b!964789 (= res!645793 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19829))))

(declare-fun b!964790 () Bool)

(declare-fun res!645797 () Bool)

(assert (=> b!964790 (=> (not res!645797) (not e!543884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964790 (= res!645797 (validKeyInArray!0 (select (arr!28572 _keys!1686) i!803)))))

(declare-fun b!964791 () Bool)

(assert (=> b!964791 (= e!543885 (and e!543887 mapRes!34483))))

(declare-fun condMapEmpty!34483 () Bool)

(declare-fun mapDefault!34483 () ValueCell!10348)

