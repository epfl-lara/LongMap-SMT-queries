; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84526 () Bool)

(assert start!84526)

(declare-fun b_free!20021 () Bool)

(declare-fun b_next!20021 () Bool)

(assert (=> start!84526 (= b_free!20021 (not b_next!20021))))

(declare-fun tp!69847 () Bool)

(declare-fun b_and!32115 () Bool)

(assert (=> start!84526 (= tp!69847 b_and!32115)))

(declare-fun b!988642 () Bool)

(declare-fun e!557475 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((V!35965 0))(
  ( (V!35966 (val!11669 Int)) )
))
(declare-datatypes ((ValueCell!11137 0))(
  ( (ValueCellFull!11137 (v!14236 V!35965)) (EmptyCell!11137) )
))
(declare-datatypes ((array!62433 0))(
  ( (array!62434 (arr!30071 (Array (_ BitVec 32) ValueCell!11137)) (size!30550 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62433)

(assert (=> b!988642 (= e!557475 (bvsge from!1932 (size!30550 _values!1278)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35965)

(declare-fun zeroValue!1220 () V!35965)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((array!62435 0))(
  ( (array!62436 (arr!30072 (Array (_ BitVec 32) (_ BitVec 64))) (size!30551 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62435)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14868 0))(
  ( (tuple2!14869 (_1!7445 (_ BitVec 64)) (_2!7445 V!35965)) )
))
(declare-datatypes ((List!20799 0))(
  ( (Nil!20796) (Cons!20795 (h!21957 tuple2!14868) (t!29736 List!20799)) )
))
(declare-datatypes ((ListLongMap!13565 0))(
  ( (ListLongMap!13566 (toList!6798 List!20799)) )
))
(declare-fun lt!438538 () ListLongMap!13565)

(declare-fun getCurrentListMapNoExtraKeys!3489 (array!62435 array!62433 (_ BitVec 32) (_ BitVec 32) V!35965 V!35965 (_ BitVec 32) Int) ListLongMap!13565)

(assert (=> b!988642 (= lt!438538 (getCurrentListMapNoExtraKeys!3489 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!661241 () Bool)

(assert (=> start!84526 (=> (not res!661241) (not e!557475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84526 (= res!661241 (validMask!0 mask!1948))))

(assert (=> start!84526 e!557475))

(assert (=> start!84526 true))

(declare-fun tp_is_empty!23237 () Bool)

(assert (=> start!84526 tp_is_empty!23237))

(declare-fun e!557478 () Bool)

(declare-fun array_inv!23237 (array!62433) Bool)

(assert (=> start!84526 (and (array_inv!23237 _values!1278) e!557478)))

(assert (=> start!84526 tp!69847))

(declare-fun array_inv!23238 (array!62435) Bool)

(assert (=> start!84526 (array_inv!23238 _keys!1544)))

(declare-fun b!988643 () Bool)

(declare-fun res!661239 () Bool)

(assert (=> b!988643 (=> (not res!661239) (not e!557475))))

(assert (=> b!988643 (= res!661239 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30551 _keys!1544))))))

(declare-fun b!988644 () Bool)

(declare-fun res!661243 () Bool)

(assert (=> b!988644 (=> (not res!661243) (not e!557475))))

(declare-datatypes ((List!20800 0))(
  ( (Nil!20797) (Cons!20796 (h!21958 (_ BitVec 64)) (t!29737 List!20800)) )
))
(declare-fun arrayNoDuplicates!0 (array!62435 (_ BitVec 32) List!20800) Bool)

(assert (=> b!988644 (= res!661243 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20797))))

(declare-fun mapNonEmpty!36894 () Bool)

(declare-fun mapRes!36894 () Bool)

(declare-fun tp!69848 () Bool)

(declare-fun e!557477 () Bool)

(assert (=> mapNonEmpty!36894 (= mapRes!36894 (and tp!69848 e!557477))))

(declare-fun mapValue!36894 () ValueCell!11137)

(declare-fun mapKey!36894 () (_ BitVec 32))

(declare-fun mapRest!36894 () (Array (_ BitVec 32) ValueCell!11137))

(assert (=> mapNonEmpty!36894 (= (arr!30071 _values!1278) (store mapRest!36894 mapKey!36894 mapValue!36894))))

(declare-fun b!988645 () Bool)

(declare-fun res!661240 () Bool)

(assert (=> b!988645 (=> (not res!661240) (not e!557475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62435 (_ BitVec 32)) Bool)

(assert (=> b!988645 (= res!661240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988646 () Bool)

(declare-fun res!661244 () Bool)

(assert (=> b!988646 (=> (not res!661244) (not e!557475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988646 (= res!661244 (validKeyInArray!0 (select (arr!30072 _keys!1544) from!1932)))))

(declare-fun b!988647 () Bool)

(declare-fun res!661245 () Bool)

(assert (=> b!988647 (=> (not res!661245) (not e!557475))))

(assert (=> b!988647 (= res!661245 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988648 () Bool)

(declare-fun res!661242 () Bool)

(assert (=> b!988648 (=> (not res!661242) (not e!557475))))

(assert (=> b!988648 (= res!661242 (and (= (size!30550 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30551 _keys!1544) (size!30550 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36894 () Bool)

(assert (=> mapIsEmpty!36894 mapRes!36894))

(declare-fun b!988649 () Bool)

(assert (=> b!988649 (= e!557477 tp_is_empty!23237)))

(declare-fun b!988650 () Bool)

(declare-fun e!557476 () Bool)

(assert (=> b!988650 (= e!557478 (and e!557476 mapRes!36894))))

(declare-fun condMapEmpty!36894 () Bool)

(declare-fun mapDefault!36894 () ValueCell!11137)

