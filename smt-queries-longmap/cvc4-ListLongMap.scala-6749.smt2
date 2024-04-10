; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84632 () Bool)

(assert start!84632)

(declare-fun b_free!20057 () Bool)

(declare-fun b_next!20057 () Bool)

(assert (=> start!84632 (= b_free!20057 (not b_next!20057))))

(declare-fun tp!69963 () Bool)

(declare-fun b_and!32189 () Bool)

(assert (=> start!84632 (= tp!69963 b_and!32189)))

(declare-fun b!989795 () Bool)

(declare-fun e!558126 () Bool)

(declare-fun tp_is_empty!23273 () Bool)

(assert (=> b!989795 (= e!558126 tp_is_empty!23273)))

(declare-fun b!989796 () Bool)

(declare-fun e!558123 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((V!36013 0))(
  ( (V!36014 (val!11687 Int)) )
))
(declare-datatypes ((ValueCell!11155 0))(
  ( (ValueCellFull!11155 (v!14257 V!36013)) (EmptyCell!11155) )
))
(declare-datatypes ((array!62505 0))(
  ( (array!62506 (arr!30105 (Array (_ BitVec 32) ValueCell!11155)) (size!30584 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62505)

(assert (=> b!989796 (= e!558123 (bvsge from!1932 (size!30584 _values!1278)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!36013)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14898 0))(
  ( (tuple2!14899 (_1!7460 (_ BitVec 64)) (_2!7460 V!36013)) )
))
(declare-datatypes ((List!20827 0))(
  ( (Nil!20824) (Cons!20823 (h!21985 tuple2!14898) (t!29784 List!20827)) )
))
(declare-datatypes ((ListLongMap!13595 0))(
  ( (ListLongMap!13596 (toList!6813 List!20827)) )
))
(declare-fun lt!439113 () ListLongMap!13595)

(declare-fun zeroValue!1220 () V!36013)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((array!62507 0))(
  ( (array!62508 (arr!30106 (Array (_ BitVec 32) (_ BitVec 64))) (size!30585 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62507)

(declare-fun getCurrentListMapNoExtraKeys!3503 (array!62507 array!62505 (_ BitVec 32) (_ BitVec 32) V!36013 V!36013 (_ BitVec 32) Int) ListLongMap!13595)

(assert (=> b!989796 (= lt!439113 (getCurrentListMapNoExtraKeys!3503 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989797 () Bool)

(declare-fun res!661882 () Bool)

(assert (=> b!989797 (=> (not res!661882) (not e!558123))))

(assert (=> b!989797 (= res!661882 (and (= (size!30584 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30585 _keys!1544) (size!30584 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36955 () Bool)

(declare-fun mapRes!36955 () Bool)

(assert (=> mapIsEmpty!36955 mapRes!36955))

(declare-fun b!989798 () Bool)

(declare-fun res!661886 () Bool)

(assert (=> b!989798 (=> (not res!661886) (not e!558123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62507 (_ BitVec 32)) Bool)

(assert (=> b!989798 (= res!661886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36955 () Bool)

(declare-fun tp!69962 () Bool)

(assert (=> mapNonEmpty!36955 (= mapRes!36955 (and tp!69962 e!558126))))

(declare-fun mapKey!36955 () (_ BitVec 32))

(declare-fun mapRest!36955 () (Array (_ BitVec 32) ValueCell!11155))

(declare-fun mapValue!36955 () ValueCell!11155)

(assert (=> mapNonEmpty!36955 (= (arr!30105 _values!1278) (store mapRest!36955 mapKey!36955 mapValue!36955))))

(declare-fun b!989800 () Bool)

(declare-fun res!661885 () Bool)

(assert (=> b!989800 (=> (not res!661885) (not e!558123))))

(assert (=> b!989800 (= res!661885 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30585 _keys!1544))))))

(declare-fun b!989801 () Bool)

(declare-fun res!661887 () Bool)

(assert (=> b!989801 (=> (not res!661887) (not e!558123))))

(declare-datatypes ((List!20828 0))(
  ( (Nil!20825) (Cons!20824 (h!21986 (_ BitVec 64)) (t!29785 List!20828)) )
))
(declare-fun arrayNoDuplicates!0 (array!62507 (_ BitVec 32) List!20828) Bool)

(assert (=> b!989801 (= res!661887 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20825))))

(declare-fun b!989802 () Bool)

(declare-fun e!558122 () Bool)

(declare-fun e!558124 () Bool)

(assert (=> b!989802 (= e!558122 (and e!558124 mapRes!36955))))

(declare-fun condMapEmpty!36955 () Bool)

(declare-fun mapDefault!36955 () ValueCell!11155)

