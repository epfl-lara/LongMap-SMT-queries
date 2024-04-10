; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79362 () Bool)

(assert start!79362)

(declare-fun b_free!17549 () Bool)

(declare-fun b_next!17549 () Bool)

(assert (=> start!79362 (= b_free!17549 (not b_next!17549))))

(declare-fun tp!61091 () Bool)

(declare-fun b_and!28657 () Bool)

(assert (=> start!79362 (= tp!61091 b_and!28657)))

(declare-fun b!932240 () Bool)

(declare-fun res!627838 () Bool)

(declare-fun e!523531 () Bool)

(assert (=> b!932240 (=> (not res!627838) (not e!523531))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932240 (= res!627838 (validKeyInArray!0 k!1099))))

(declare-fun b!932241 () Bool)

(declare-fun res!627840 () Bool)

(declare-fun e!523533 () Bool)

(assert (=> b!932241 (=> (not res!627840) (not e!523533))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56054 0))(
  ( (array!56055 (arr!26971 (Array (_ BitVec 32) (_ BitVec 64))) (size!27430 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56054)

(assert (=> b!932241 (= res!627840 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27430 _keys!1487))))))

(declare-fun res!627844 () Bool)

(assert (=> start!79362 (=> (not res!627844) (not e!523533))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79362 (= res!627844 (validMask!0 mask!1881))))

(assert (=> start!79362 e!523533))

(assert (=> start!79362 true))

(declare-fun tp_is_empty!20057 () Bool)

(assert (=> start!79362 tp_is_empty!20057))

(declare-datatypes ((V!31707 0))(
  ( (V!31708 (val!10079 Int)) )
))
(declare-datatypes ((ValueCell!9547 0))(
  ( (ValueCellFull!9547 (v!12598 V!31707)) (EmptyCell!9547) )
))
(declare-datatypes ((array!56056 0))(
  ( (array!56057 (arr!26972 (Array (_ BitVec 32) ValueCell!9547)) (size!27431 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56056)

(declare-fun e!523529 () Bool)

(declare-fun array_inv!20994 (array!56056) Bool)

(assert (=> start!79362 (and (array_inv!20994 _values!1231) e!523529)))

(assert (=> start!79362 tp!61091))

(declare-fun array_inv!20995 (array!56054) Bool)

(assert (=> start!79362 (array_inv!20995 _keys!1487)))

(declare-fun b!932242 () Bool)

(declare-fun e!523532 () Bool)

(assert (=> b!932242 (= e!523532 tp_is_empty!20057)))

(declare-fun b!932243 () Bool)

(declare-fun res!627842 () Bool)

(assert (=> b!932243 (=> (not res!627842) (not e!523533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56054 (_ BitVec 32)) Bool)

(assert (=> b!932243 (= res!627842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932244 () Bool)

(declare-fun res!627836 () Bool)

(assert (=> b!932244 (=> (not res!627836) (not e!523533))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!932244 (= res!627836 (and (= (size!27431 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27430 _keys!1487) (size!27431 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932245 () Bool)

(declare-fun e!523528 () Bool)

(assert (=> b!932245 (= e!523528 tp_is_empty!20057)))

(declare-fun b!932246 () Bool)

(declare-fun mapRes!31845 () Bool)

(assert (=> b!932246 (= e!523529 (and e!523532 mapRes!31845))))

(declare-fun condMapEmpty!31845 () Bool)

(declare-fun mapDefault!31845 () ValueCell!9547)

