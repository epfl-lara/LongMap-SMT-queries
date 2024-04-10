; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82340 () Bool)

(assert start!82340)

(declare-fun b_free!18607 () Bool)

(declare-fun b_next!18607 () Bool)

(assert (=> start!82340 (= b_free!18607 (not b_next!18607))))

(declare-fun tp!64790 () Bool)

(declare-fun b_and!30095 () Bool)

(assert (=> start!82340 (= tp!64790 b_and!30095)))

(declare-fun mapNonEmpty!33958 () Bool)

(declare-fun mapRes!33958 () Bool)

(declare-fun tp!64791 () Bool)

(declare-fun e!541167 () Bool)

(assert (=> mapNonEmpty!33958 (= mapRes!33958 (and tp!64791 e!541167))))

(declare-datatypes ((V!33409 0))(
  ( (V!33410 (val!10710 Int)) )
))
(declare-datatypes ((ValueCell!10178 0))(
  ( (ValueCellFull!10178 (v!13267 V!33409)) (EmptyCell!10178) )
))
(declare-datatypes ((array!58729 0))(
  ( (array!58730 (arr!28238 (Array (_ BitVec 32) ValueCell!10178)) (size!28717 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58729)

(declare-fun mapRest!33958 () (Array (_ BitVec 32) ValueCell!10178))

(declare-fun mapValue!33958 () ValueCell!10178)

(declare-fun mapKey!33958 () (_ BitVec 32))

(assert (=> mapNonEmpty!33958 (= (arr!28238 _values!1386) (store mapRest!33958 mapKey!33958 mapValue!33958))))

(declare-fun b!960017 () Bool)

(declare-fun e!541170 () Bool)

(assert (=> b!960017 (= e!541170 false)))

(declare-fun lt!430602 () Bool)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33409)

(declare-datatypes ((array!58731 0))(
  ( (array!58732 (arr!28239 (Array (_ BitVec 32) (_ BitVec 64))) (size!28718 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58731)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33409)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((tuple2!13816 0))(
  ( (tuple2!13817 (_1!6919 (_ BitVec 64)) (_2!6919 V!33409)) )
))
(declare-datatypes ((List!19636 0))(
  ( (Nil!19633) (Cons!19632 (h!20794 tuple2!13816) (t!27999 List!19636)) )
))
(declare-datatypes ((ListLongMap!12513 0))(
  ( (ListLongMap!12514 (toList!6272 List!19636)) )
))
(declare-fun contains!5371 (ListLongMap!12513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3505 (array!58731 array!58729 (_ BitVec 32) (_ BitVec 32) V!33409 V!33409 (_ BitVec 32) Int) ListLongMap!12513)

(assert (=> b!960017 (= lt!430602 (contains!5371 (getCurrentListMap!3505 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28239 _keys!1668) i!793)))))

(declare-fun b!960018 () Bool)

(declare-fun res!642620 () Bool)

(assert (=> b!960018 (=> (not res!642620) (not e!541170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58731 (_ BitVec 32)) Bool)

(assert (=> b!960018 (= res!642620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960019 () Bool)

(declare-fun res!642622 () Bool)

(assert (=> b!960019 (=> (not res!642622) (not e!541170))))

(assert (=> b!960019 (= res!642622 (and (= (size!28717 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28718 _keys!1668) (size!28717 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960020 () Bool)

(declare-fun res!642621 () Bool)

(assert (=> b!960020 (=> (not res!642621) (not e!541170))))

(assert (=> b!960020 (= res!642621 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28718 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28718 _keys!1668))))))

(declare-fun b!960021 () Bool)

(declare-fun e!541166 () Bool)

(declare-fun e!541168 () Bool)

(assert (=> b!960021 (= e!541166 (and e!541168 mapRes!33958))))

(declare-fun condMapEmpty!33958 () Bool)

(declare-fun mapDefault!33958 () ValueCell!10178)

