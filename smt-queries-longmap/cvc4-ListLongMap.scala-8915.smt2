; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108162 () Bool)

(assert start!108162)

(declare-fun b_free!27857 () Bool)

(declare-fun b_next!27857 () Bool)

(assert (=> start!108162 (= b_free!27857 (not b_next!27857))))

(declare-fun tp!98528 () Bool)

(declare-fun b_and!45915 () Bool)

(assert (=> start!108162 (= tp!98528 b_and!45915)))

(declare-fun res!848748 () Bool)

(declare-fun e!729440 () Bool)

(assert (=> start!108162 (=> (not res!848748) (not e!729440))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108162 (= res!848748 (validMask!0 mask!1805))))

(assert (=> start!108162 e!729440))

(assert (=> start!108162 true))

(assert (=> start!108162 tp!98528))

(declare-fun tp_is_empty!33407 () Bool)

(assert (=> start!108162 tp_is_empty!33407))

(declare-datatypes ((V!49645 0))(
  ( (V!49646 (val!16778 Int)) )
))
(declare-datatypes ((ValueCell!15805 0))(
  ( (ValueCellFull!15805 (v!19376 V!49645)) (EmptyCell!15805) )
))
(declare-datatypes ((array!83908 0))(
  ( (array!83909 (arr!40464 (Array (_ BitVec 32) ValueCell!15805)) (size!41014 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83908)

(declare-fun e!729441 () Bool)

(declare-fun array_inv!30745 (array!83908) Bool)

(assert (=> start!108162 (and (array_inv!30745 _values!1187) e!729441)))

(declare-datatypes ((array!83910 0))(
  ( (array!83911 (arr!40465 (Array (_ BitVec 32) (_ BitVec 64))) (size!41015 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83910)

(declare-fun array_inv!30746 (array!83910) Bool)

(assert (=> start!108162 (array_inv!30746 _keys!1427)))

(declare-fun mapIsEmpty!51644 () Bool)

(declare-fun mapRes!51644 () Bool)

(assert (=> mapIsEmpty!51644 mapRes!51644))

(declare-fun b!1277298 () Bool)

(declare-fun res!848749 () Bool)

(assert (=> b!1277298 (=> (not res!848749) (not e!729440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83910 (_ BitVec 32)) Bool)

(assert (=> b!1277298 (= res!848749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277299 () Bool)

(declare-fun e!729444 () Bool)

(assert (=> b!1277299 (= e!729441 (and e!729444 mapRes!51644))))

(declare-fun condMapEmpty!51644 () Bool)

(declare-fun mapDefault!51644 () ValueCell!15805)

