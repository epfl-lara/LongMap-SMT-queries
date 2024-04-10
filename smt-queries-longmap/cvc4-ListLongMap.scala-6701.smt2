; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84182 () Bool)

(assert start!84182)

(declare-fun b_free!19883 () Bool)

(declare-fun b_next!19883 () Bool)

(assert (=> start!84182 (= b_free!19883 (not b_next!19883))))

(declare-fun tp!69252 () Bool)

(declare-fun b_and!31843 () Bool)

(assert (=> start!84182 (= tp!69252 b_and!31843)))

(declare-fun b!984492 () Bool)

(declare-fun e!554993 () Bool)

(declare-fun e!554991 () Bool)

(assert (=> b!984492 (= e!554993 e!554991)))

(declare-fun res!658772 () Bool)

(assert (=> b!984492 (=> (not res!658772) (not e!554991))))

(declare-datatypes ((array!61951 0))(
  ( (array!61952 (arr!29833 (Array (_ BitVec 32) (_ BitVec 64))) (size!30312 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61951)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984492 (= res!658772 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29833 _keys!1544) from!1932))))))

(declare-datatypes ((V!35629 0))(
  ( (V!35630 (val!11543 Int)) )
))
(declare-datatypes ((ValueCell!11011 0))(
  ( (ValueCellFull!11011 (v!14105 V!35629)) (EmptyCell!11011) )
))
(declare-datatypes ((array!61953 0))(
  ( (array!61954 (arr!29834 (Array (_ BitVec 32) ValueCell!11011)) (size!30313 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61953)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436840 () V!35629)

(declare-fun get!15473 (ValueCell!11011 V!35629) V!35629)

(declare-fun dynLambda!1818 (Int (_ BitVec 64)) V!35629)

(assert (=> b!984492 (= lt!436840 (get!15473 (select (arr!29834 _values!1278) from!1932) (dynLambda!1818 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35629)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35629)

(declare-datatypes ((tuple2!14762 0))(
  ( (tuple2!14763 (_1!7392 (_ BitVec 64)) (_2!7392 V!35629)) )
))
(declare-datatypes ((List!20655 0))(
  ( (Nil!20652) (Cons!20651 (h!21813 tuple2!14762) (t!29482 List!20655)) )
))
(declare-datatypes ((ListLongMap!13459 0))(
  ( (ListLongMap!13460 (toList!6745 List!20655)) )
))
(declare-fun lt!436841 () ListLongMap!13459)

(declare-fun getCurrentListMapNoExtraKeys!3438 (array!61951 array!61953 (_ BitVec 32) (_ BitVec 32) V!35629 V!35629 (_ BitVec 32) Int) ListLongMap!13459)

(assert (=> b!984492 (= lt!436841 (getCurrentListMapNoExtraKeys!3438 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984493 () Bool)

(declare-fun res!658775 () Bool)

(assert (=> b!984493 (=> (not res!658775) (not e!554993))))

(declare-datatypes ((List!20656 0))(
  ( (Nil!20653) (Cons!20652 (h!21814 (_ BitVec 64)) (t!29483 List!20656)) )
))
(declare-fun arrayNoDuplicates!0 (array!61951 (_ BitVec 32) List!20656) Bool)

(assert (=> b!984493 (= res!658775 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20653))))

(declare-fun mapNonEmpty!36506 () Bool)

(declare-fun mapRes!36506 () Bool)

(declare-fun tp!69253 () Bool)

(declare-fun e!554992 () Bool)

(assert (=> mapNonEmpty!36506 (= mapRes!36506 (and tp!69253 e!554992))))

(declare-fun mapKey!36506 () (_ BitVec 32))

(declare-fun mapRest!36506 () (Array (_ BitVec 32) ValueCell!11011))

(declare-fun mapValue!36506 () ValueCell!11011)

(assert (=> mapNonEmpty!36506 (= (arr!29834 _values!1278) (store mapRest!36506 mapKey!36506 mapValue!36506))))

(declare-fun b!984494 () Bool)

(declare-fun res!658773 () Bool)

(assert (=> b!984494 (=> (not res!658773) (not e!554993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984494 (= res!658773 (validKeyInArray!0 (select (arr!29833 _keys!1544) from!1932)))))

(declare-fun b!984495 () Bool)

(declare-fun res!658770 () Bool)

(assert (=> b!984495 (=> (not res!658770) (not e!554993))))

(assert (=> b!984495 (= res!658770 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30312 _keys!1544))))))

(declare-fun b!984496 () Bool)

(declare-fun e!554990 () Bool)

(declare-fun e!554994 () Bool)

(assert (=> b!984496 (= e!554990 (and e!554994 mapRes!36506))))

(declare-fun condMapEmpty!36506 () Bool)

(declare-fun mapDefault!36506 () ValueCell!11011)

