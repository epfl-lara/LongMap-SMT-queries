; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110338 () Bool)

(assert start!110338)

(declare-fun b_free!29321 () Bool)

(declare-fun b_next!29321 () Bool)

(assert (=> start!110338 (= b_free!29321 (not b_next!29321))))

(declare-fun tp!103131 () Bool)

(declare-fun b_and!47527 () Bool)

(assert (=> start!110338 (= tp!103131 b_and!47527)))

(declare-fun b!1305954 () Bool)

(declare-fun res!867090 () Bool)

(declare-fun e!744928 () Bool)

(assert (=> b!1305954 (=> (not res!867090) (not e!744928))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86938 0))(
  ( (array!86939 (arr!41955 (Array (_ BitVec 32) (_ BitVec 64))) (size!42505 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86938)

(assert (=> b!1305954 (= res!867090 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42505 _keys!1741))))))

(declare-fun b!1305955 () Bool)

(declare-fun e!744926 () Bool)

(declare-fun tp_is_empty!34961 () Bool)

(assert (=> b!1305955 (= e!744926 tp_is_empty!34961)))

(declare-fun res!867086 () Bool)

(assert (=> start!110338 (=> (not res!867086) (not e!744928))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110338 (= res!867086 (validMask!0 mask!2175))))

(assert (=> start!110338 e!744928))

(assert (=> start!110338 tp_is_empty!34961))

(assert (=> start!110338 true))

(declare-datatypes ((V!51717 0))(
  ( (V!51718 (val!17555 Int)) )
))
(declare-datatypes ((ValueCell!16582 0))(
  ( (ValueCellFull!16582 (v!20180 V!51717)) (EmptyCell!16582) )
))
(declare-datatypes ((array!86940 0))(
  ( (array!86941 (arr!41956 (Array (_ BitVec 32) ValueCell!16582)) (size!42506 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86940)

(declare-fun e!744930 () Bool)

(declare-fun array_inv!31723 (array!86940) Bool)

(assert (=> start!110338 (and (array_inv!31723 _values!1445) e!744930)))

(declare-fun array_inv!31724 (array!86938) Bool)

(assert (=> start!110338 (array_inv!31724 _keys!1741)))

(assert (=> start!110338 tp!103131))

(declare-fun b!1305956 () Bool)

(declare-fun res!867088 () Bool)

(assert (=> b!1305956 (=> (not res!867088) (not e!744928))))

(declare-datatypes ((List!29785 0))(
  ( (Nil!29782) (Cons!29781 (h!30990 (_ BitVec 64)) (t!43389 List!29785)) )
))
(declare-fun arrayNoDuplicates!0 (array!86938 (_ BitVec 32) List!29785) Bool)

(assert (=> b!1305956 (= res!867088 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29782))))

(declare-fun b!1305957 () Bool)

(declare-fun res!867089 () Bool)

(assert (=> b!1305957 (=> (not res!867089) (not e!744928))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1305957 (= res!867089 (and (= (size!42506 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42505 _keys!1741) (size!42506 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305958 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1305958 (= e!744928 (and (or (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1305959 () Bool)

(declare-fun e!744927 () Bool)

(assert (=> b!1305959 (= e!744927 tp_is_empty!34961)))

(declare-fun mapNonEmpty!54052 () Bool)

(declare-fun mapRes!54052 () Bool)

(declare-fun tp!103132 () Bool)

(assert (=> mapNonEmpty!54052 (= mapRes!54052 (and tp!103132 e!744926))))

(declare-fun mapKey!54052 () (_ BitVec 32))

(declare-fun mapValue!54052 () ValueCell!16582)

(declare-fun mapRest!54052 () (Array (_ BitVec 32) ValueCell!16582))

(assert (=> mapNonEmpty!54052 (= (arr!41956 _values!1445) (store mapRest!54052 mapKey!54052 mapValue!54052))))

(declare-fun b!1305960 () Bool)

(assert (=> b!1305960 (= e!744930 (and e!744927 mapRes!54052))))

(declare-fun condMapEmpty!54052 () Bool)

(declare-fun mapDefault!54052 () ValueCell!16582)

