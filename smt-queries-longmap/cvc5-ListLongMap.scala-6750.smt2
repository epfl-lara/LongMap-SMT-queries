; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84634 () Bool)

(assert start!84634)

(declare-fun b_free!20059 () Bool)

(declare-fun b_next!20059 () Bool)

(assert (=> start!84634 (= b_free!20059 (not b_next!20059))))

(declare-fun tp!69969 () Bool)

(declare-fun b_and!32191 () Bool)

(assert (=> start!84634 (= tp!69969 b_and!32191)))

(declare-fun b!989825 () Bool)

(declare-fun res!661902 () Bool)

(declare-fun e!558140 () Bool)

(assert (=> b!989825 (=> (not res!661902) (not e!558140))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62509 0))(
  ( (array!62510 (arr!30107 (Array (_ BitVec 32) (_ BitVec 64))) (size!30586 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62509)

(assert (=> b!989825 (= res!661902 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30586 _keys!1544))))))

(declare-fun mapNonEmpty!36958 () Bool)

(declare-fun mapRes!36958 () Bool)

(declare-fun tp!69968 () Bool)

(declare-fun e!558139 () Bool)

(assert (=> mapNonEmpty!36958 (= mapRes!36958 (and tp!69968 e!558139))))

(declare-datatypes ((V!36017 0))(
  ( (V!36018 (val!11688 Int)) )
))
(declare-datatypes ((ValueCell!11156 0))(
  ( (ValueCellFull!11156 (v!14258 V!36017)) (EmptyCell!11156) )
))
(declare-datatypes ((array!62511 0))(
  ( (array!62512 (arr!30108 (Array (_ BitVec 32) ValueCell!11156)) (size!30587 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62511)

(declare-fun mapValue!36958 () ValueCell!11156)

(declare-fun mapKey!36958 () (_ BitVec 32))

(declare-fun mapRest!36958 () (Array (_ BitVec 32) ValueCell!11156))

(assert (=> mapNonEmpty!36958 (= (arr!30108 _values!1278) (store mapRest!36958 mapKey!36958 mapValue!36958))))

(declare-fun b!989827 () Bool)

(declare-fun res!661906 () Bool)

(assert (=> b!989827 (=> (not res!661906) (not e!558140))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62509 (_ BitVec 32)) Bool)

(assert (=> b!989827 (= res!661906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989828 () Bool)

(declare-fun res!661907 () Bool)

(assert (=> b!989828 (=> (not res!661907) (not e!558140))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989828 (= res!661907 (and (= (size!30587 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30586 _keys!1544) (size!30587 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989829 () Bool)

(declare-fun res!661904 () Bool)

(assert (=> b!989829 (=> (not res!661904) (not e!558140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989829 (= res!661904 (validKeyInArray!0 (select (arr!30107 _keys!1544) from!1932)))))

(declare-fun b!989830 () Bool)

(declare-fun tp_is_empty!23275 () Bool)

(assert (=> b!989830 (= e!558139 tp_is_empty!23275)))

(declare-fun b!989831 () Bool)

(declare-fun e!558137 () Bool)

(assert (=> b!989831 (= e!558137 tp_is_empty!23275)))

(declare-fun b!989832 () Bool)

(assert (=> b!989832 (= e!558140 (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30107 _keys!1544) from!1932)))))

(declare-fun minValue!1220 () V!36017)

(declare-fun zeroValue!1220 () V!36017)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14900 0))(
  ( (tuple2!14901 (_1!7461 (_ BitVec 64)) (_2!7461 V!36017)) )
))
(declare-datatypes ((List!20829 0))(
  ( (Nil!20826) (Cons!20825 (h!21987 tuple2!14900) (t!29786 List!20829)) )
))
(declare-datatypes ((ListLongMap!13597 0))(
  ( (ListLongMap!13598 (toList!6814 List!20829)) )
))
(declare-fun lt!439116 () ListLongMap!13597)

(declare-fun getCurrentListMapNoExtraKeys!3504 (array!62509 array!62511 (_ BitVec 32) (_ BitVec 32) V!36017 V!36017 (_ BitVec 32) Int) ListLongMap!13597)

(assert (=> b!989832 (= lt!439116 (getCurrentListMapNoExtraKeys!3504 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989833 () Bool)

(declare-fun res!661908 () Bool)

(assert (=> b!989833 (=> (not res!661908) (not e!558140))))

(assert (=> b!989833 (= res!661908 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!989834 () Bool)

(declare-fun res!661903 () Bool)

(assert (=> b!989834 (=> (not res!661903) (not e!558140))))

(declare-datatypes ((List!20830 0))(
  ( (Nil!20827) (Cons!20826 (h!21988 (_ BitVec 64)) (t!29787 List!20830)) )
))
(declare-fun arrayNoDuplicates!0 (array!62509 (_ BitVec 32) List!20830) Bool)

(assert (=> b!989834 (= res!661903 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20827))))

(declare-fun mapIsEmpty!36958 () Bool)

(assert (=> mapIsEmpty!36958 mapRes!36958))

(declare-fun b!989826 () Bool)

(declare-fun e!558141 () Bool)

(assert (=> b!989826 (= e!558141 (and e!558137 mapRes!36958))))

(declare-fun condMapEmpty!36958 () Bool)

(declare-fun mapDefault!36958 () ValueCell!11156)

