; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73838 () Bool)

(assert start!73838)

(declare-fun b_free!14753 () Bool)

(declare-fun b_next!14753 () Bool)

(assert (=> start!73838 (= b_free!14753 (not b_next!14753))))

(declare-fun tp!51763 () Bool)

(declare-fun b_and!24485 () Bool)

(assert (=> start!73838 (= tp!51763 b_and!24485)))

(declare-fun res!589130 () Bool)

(declare-fun e!482996 () Bool)

(assert (=> start!73838 (=> (not res!589130) (not e!482996))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49938 0))(
  ( (array!49939 (arr!24000 (Array (_ BitVec 32) (_ BitVec 64))) (size!24440 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49938)

(assert (=> start!73838 (= res!589130 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24440 _keys!868))))))

(assert (=> start!73838 e!482996))

(declare-fun tp_is_empty!16889 () Bool)

(assert (=> start!73838 tp_is_empty!16889))

(assert (=> start!73838 true))

(assert (=> start!73838 tp!51763))

(declare-fun array_inv!18968 (array!49938) Bool)

(assert (=> start!73838 (array_inv!18968 _keys!868)))

(declare-datatypes ((V!27565 0))(
  ( (V!27566 (val!8492 Int)) )
))
(declare-datatypes ((ValueCell!8005 0))(
  ( (ValueCellFull!8005 (v!10917 V!27565)) (EmptyCell!8005) )
))
(declare-datatypes ((array!49940 0))(
  ( (array!49941 (arr!24001 (Array (_ BitVec 32) ValueCell!8005)) (size!24441 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49940)

(declare-fun e!482995 () Bool)

(declare-fun array_inv!18969 (array!49940) Bool)

(assert (=> start!73838 (and (array_inv!18969 _values!688) e!482995)))

(declare-fun b!867075 () Bool)

(declare-fun res!589128 () Bool)

(assert (=> b!867075 (=> (not res!589128) (not e!482996))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49938 (_ BitVec 32)) Bool)

(assert (=> b!867075 (= res!589128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867076 () Bool)

(declare-datatypes ((Unit!29733 0))(
  ( (Unit!29734) )
))
(declare-fun e!482997 () Unit!29733)

(declare-fun Unit!29735 () Unit!29733)

(assert (=> b!867076 (= e!482997 Unit!29735)))

(declare-fun b!867077 () Bool)

(declare-fun res!589125 () Bool)

(assert (=> b!867077 (=> (not res!589125) (not e!482996))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867077 (= res!589125 (validKeyInArray!0 k!854))))

(declare-fun b!867078 () Bool)

(declare-fun e!482992 () Bool)

(declare-fun mapRes!26933 () Bool)

(assert (=> b!867078 (= e!482995 (and e!482992 mapRes!26933))))

(declare-fun condMapEmpty!26933 () Bool)

(declare-fun mapDefault!26933 () ValueCell!8005)

