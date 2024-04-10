; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82664 () Bool)

(assert start!82664)

(declare-fun b_free!18797 () Bool)

(declare-fun b_next!18797 () Bool)

(assert (=> start!82664 (= b_free!18797 (not b_next!18797))))

(declare-fun tp!65511 () Bool)

(declare-fun b_and!30285 () Bool)

(assert (=> start!82664 (= tp!65511 b_and!30285)))

(declare-fun b!963723 () Bool)

(declare-fun e!543364 () Bool)

(declare-fun tp_is_empty!21599 () Bool)

(assert (=> b!963723 (= e!543364 tp_is_empty!21599)))

(declare-fun b!963724 () Bool)

(declare-fun res!645005 () Bool)

(declare-fun e!543362 () Bool)

(assert (=> b!963724 (=> (not res!645005) (not e!543362))))

(declare-datatypes ((array!59289 0))(
  ( (array!59290 (arr!28513 (Array (_ BitVec 32) (_ BitVec 64))) (size!28992 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59289)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59289 (_ BitVec 32)) Bool)

(assert (=> b!963724 (= res!645005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963725 () Bool)

(declare-fun res!645006 () Bool)

(assert (=> b!963725 (=> (not res!645006) (not e!543362))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33781 0))(
  ( (V!33782 (val!10850 Int)) )
))
(declare-datatypes ((ValueCell!10318 0))(
  ( (ValueCellFull!10318 (v!13408 V!33781)) (EmptyCell!10318) )
))
(declare-datatypes ((array!59291 0))(
  ( (array!59292 (arr!28514 (Array (_ BitVec 32) ValueCell!10318)) (size!28993 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59291)

(declare-fun minValue!1342 () V!33781)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33781)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13938 0))(
  ( (tuple2!13939 (_1!6980 (_ BitVec 64)) (_2!6980 V!33781)) )
))
(declare-datatypes ((List!19789 0))(
  ( (Nil!19786) (Cons!19785 (h!20947 tuple2!13938) (t!28152 List!19789)) )
))
(declare-datatypes ((ListLongMap!12635 0))(
  ( (ListLongMap!12636 (toList!6333 List!19789)) )
))
(declare-fun contains!5436 (ListLongMap!12635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3566 (array!59289 array!59291 (_ BitVec 32) (_ BitVec 32) V!33781 V!33781 (_ BitVec 32) Int) ListLongMap!12635)

(assert (=> b!963725 (= res!645006 (contains!5436 (getCurrentListMap!3566 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28513 _keys!1686) i!803)))))

(declare-fun b!963726 () Bool)

(assert (=> b!963726 (= e!543362 (not true))))

(assert (=> b!963726 (contains!5436 (getCurrentListMap!3566 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28513 _keys!1686) i!803))))

(declare-datatypes ((Unit!32249 0))(
  ( (Unit!32250) )
))
(declare-fun lt!430999 () Unit!32249)

(declare-fun lemmaInListMapFromThenInFromMinusOne!19 (array!59289 array!59291 (_ BitVec 32) (_ BitVec 32) V!33781 V!33781 (_ BitVec 32) (_ BitVec 32) Int) Unit!32249)

(assert (=> b!963726 (= lt!430999 (lemmaInListMapFromThenInFromMinusOne!19 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963727 () Bool)

(declare-fun res!645004 () Bool)

(assert (=> b!963727 (=> (not res!645004) (not e!543362))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963727 (= res!645004 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963728 () Bool)

(declare-fun res!645003 () Bool)

(assert (=> b!963728 (=> (not res!645003) (not e!543362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963728 (= res!645003 (validKeyInArray!0 (select (arr!28513 _keys!1686) i!803)))))

(declare-fun b!963729 () Bool)

(declare-fun e!543363 () Bool)

(assert (=> b!963729 (= e!543363 tp_is_empty!21599)))

(declare-fun mapNonEmpty!34393 () Bool)

(declare-fun mapRes!34393 () Bool)

(declare-fun tp!65510 () Bool)

(assert (=> mapNonEmpty!34393 (= mapRes!34393 (and tp!65510 e!543363))))

(declare-fun mapRest!34393 () (Array (_ BitVec 32) ValueCell!10318))

(declare-fun mapValue!34393 () ValueCell!10318)

(declare-fun mapKey!34393 () (_ BitVec 32))

(assert (=> mapNonEmpty!34393 (= (arr!28514 _values!1400) (store mapRest!34393 mapKey!34393 mapValue!34393))))

(declare-fun b!963730 () Bool)

(declare-fun res!645000 () Bool)

(assert (=> b!963730 (=> (not res!645000) (not e!543362))))

(assert (=> b!963730 (= res!645000 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28992 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28992 _keys!1686))))))

(declare-fun b!963731 () Bool)

(declare-fun e!543361 () Bool)

(assert (=> b!963731 (= e!543361 (and e!543364 mapRes!34393))))

(declare-fun condMapEmpty!34393 () Bool)

(declare-fun mapDefault!34393 () ValueCell!10318)

