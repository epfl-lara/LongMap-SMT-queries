; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84638 () Bool)

(assert start!84638)

(declare-fun b_free!20063 () Bool)

(declare-fun b_next!20063 () Bool)

(assert (=> start!84638 (= b_free!20063 (not b_next!20063))))

(declare-fun tp!69980 () Bool)

(declare-fun b_and!32195 () Bool)

(assert (=> start!84638 (= tp!69980 b_and!32195)))

(declare-fun b!989885 () Bool)

(declare-fun res!661949 () Bool)

(declare-fun e!558171 () Bool)

(assert (=> b!989885 (=> (not res!661949) (not e!558171))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62517 0))(
  ( (array!62518 (arr!30111 (Array (_ BitVec 32) (_ BitVec 64))) (size!30590 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62517)

(assert (=> b!989885 (= res!661949 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30590 _keys!1544))))))

(declare-fun mapIsEmpty!36964 () Bool)

(declare-fun mapRes!36964 () Bool)

(assert (=> mapIsEmpty!36964 mapRes!36964))

(declare-fun b!989886 () Bool)

(declare-fun res!661944 () Bool)

(assert (=> b!989886 (=> (not res!661944) (not e!558171))))

(declare-datatypes ((List!20833 0))(
  ( (Nil!20830) (Cons!20829 (h!21991 (_ BitVec 64)) (t!29790 List!20833)) )
))
(declare-fun arrayNoDuplicates!0 (array!62517 (_ BitVec 32) List!20833) Bool)

(assert (=> b!989886 (= res!661944 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20830))))

(declare-fun b!989887 () Bool)

(assert (=> b!989887 (= e!558171 (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30111 _keys!1544) from!1932)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36021 0))(
  ( (V!36022 (val!11690 Int)) )
))
(declare-fun minValue!1220 () V!36021)

(declare-datatypes ((ValueCell!11158 0))(
  ( (ValueCellFull!11158 (v!14260 V!36021)) (EmptyCell!11158) )
))
(declare-datatypes ((array!62519 0))(
  ( (array!62520 (arr!30112 (Array (_ BitVec 32) ValueCell!11158)) (size!30591 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62519)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14904 0))(
  ( (tuple2!14905 (_1!7463 (_ BitVec 64)) (_2!7463 V!36021)) )
))
(declare-datatypes ((List!20834 0))(
  ( (Nil!20831) (Cons!20830 (h!21992 tuple2!14904) (t!29791 List!20834)) )
))
(declare-datatypes ((ListLongMap!13601 0))(
  ( (ListLongMap!13602 (toList!6816 List!20834)) )
))
(declare-fun lt!439122 () ListLongMap!13601)

(declare-fun zeroValue!1220 () V!36021)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3506 (array!62517 array!62519 (_ BitVec 32) (_ BitVec 32) V!36021 V!36021 (_ BitVec 32) Int) ListLongMap!13601)

(assert (=> b!989887 (= lt!439122 (getCurrentListMapNoExtraKeys!3506 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989888 () Bool)

(declare-fun res!661950 () Bool)

(assert (=> b!989888 (=> (not res!661950) (not e!558171))))

(assert (=> b!989888 (= res!661950 (and (= (size!30591 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30590 _keys!1544) (size!30591 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989889 () Bool)

(declare-fun e!558168 () Bool)

(declare-fun e!558169 () Bool)

(assert (=> b!989889 (= e!558168 (and e!558169 mapRes!36964))))

(declare-fun condMapEmpty!36964 () Bool)

(declare-fun mapDefault!36964 () ValueCell!11158)

