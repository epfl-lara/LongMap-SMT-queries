; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108188 () Bool)

(assert start!108188)

(declare-fun b_free!27883 () Bool)

(declare-fun b_next!27883 () Bool)

(assert (=> start!108188 (= b_free!27883 (not b_next!27883))))

(declare-fun tp!98605 () Bool)

(declare-fun b_and!45941 () Bool)

(assert (=> start!108188 (= tp!98605 b_and!45941)))

(declare-fun b!1277571 () Bool)

(declare-fun e!729637 () Bool)

(declare-fun tp_is_empty!33433 () Bool)

(assert (=> b!1277571 (= e!729637 tp_is_empty!33433)))

(declare-fun mapIsEmpty!51683 () Bool)

(declare-fun mapRes!51683 () Bool)

(assert (=> mapIsEmpty!51683 mapRes!51683))

(declare-fun b!1277572 () Bool)

(declare-fun e!729639 () Bool)

(assert (=> b!1277572 (= e!729639 tp_is_empty!33433)))

(declare-fun b!1277573 () Bool)

(declare-fun res!848906 () Bool)

(declare-fun e!729638 () Bool)

(assert (=> b!1277573 (=> (not res!848906) (not e!729638))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83960 0))(
  ( (array!83961 (arr!40490 (Array (_ BitVec 32) (_ BitVec 64))) (size!41040 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83960)

(declare-datatypes ((V!49681 0))(
  ( (V!49682 (val!16791 Int)) )
))
(declare-datatypes ((ValueCell!15818 0))(
  ( (ValueCellFull!15818 (v!19389 V!49681)) (EmptyCell!15818) )
))
(declare-datatypes ((array!83962 0))(
  ( (array!83963 (arr!40491 (Array (_ BitVec 32) ValueCell!15818)) (size!41041 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83962)

(assert (=> b!1277573 (= res!848906 (and (= (size!41041 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41040 _keys!1427) (size!41041 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277574 () Bool)

(declare-fun res!848907 () Bool)

(assert (=> b!1277574 (=> (not res!848907) (not e!729638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83960 (_ BitVec 32)) Bool)

(assert (=> b!1277574 (= res!848907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277575 () Bool)

(declare-fun e!729635 () Bool)

(assert (=> b!1277575 (= e!729635 (and e!729639 mapRes!51683))))

(declare-fun condMapEmpty!51683 () Bool)

(declare-fun mapDefault!51683 () ValueCell!15818)

