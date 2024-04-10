; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79230 () Bool)

(assert start!79230)

(declare-fun b_free!17443 () Bool)

(declare-fun b_next!17443 () Bool)

(assert (=> start!79230 (= b_free!17443 (not b_next!17443))))

(declare-fun tp!60770 () Bool)

(declare-fun b_and!28509 () Bool)

(assert (=> start!79230 (= tp!60770 b_and!28509)))

(declare-fun b!930330 () Bool)

(declare-fun e!522411 () Bool)

(declare-fun tp_is_empty!19951 () Bool)

(assert (=> b!930330 (= e!522411 tp_is_empty!19951)))

(declare-fun b!930331 () Bool)

(declare-fun e!522410 () Bool)

(assert (=> b!930331 (= e!522410 tp_is_empty!19951)))

(declare-fun b!930332 () Bool)

(declare-fun res!626533 () Bool)

(declare-fun e!522412 () Bool)

(assert (=> b!930332 (=> (not res!626533) (not e!522412))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55848 0))(
  ( (array!55849 (arr!26869 (Array (_ BitVec 32) (_ BitVec 64))) (size!27328 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55848)

(assert (=> b!930332 (= res!626533 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27328 _keys!1487))))))

(declare-fun res!626535 () Bool)

(assert (=> start!79230 (=> (not res!626535) (not e!522412))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79230 (= res!626535 (validMask!0 mask!1881))))

(assert (=> start!79230 e!522412))

(assert (=> start!79230 true))

(declare-datatypes ((V!31567 0))(
  ( (V!31568 (val!10026 Int)) )
))
(declare-datatypes ((ValueCell!9494 0))(
  ( (ValueCellFull!9494 (v!12544 V!31567)) (EmptyCell!9494) )
))
(declare-datatypes ((array!55850 0))(
  ( (array!55851 (arr!26870 (Array (_ BitVec 32) ValueCell!9494)) (size!27329 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55850)

(declare-fun e!522413 () Bool)

(declare-fun array_inv!20910 (array!55850) Bool)

(assert (=> start!79230 (and (array_inv!20910 _values!1231) e!522413)))

(assert (=> start!79230 tp!60770))

(declare-fun array_inv!20911 (array!55848) Bool)

(assert (=> start!79230 (array_inv!20911 _keys!1487)))

(assert (=> start!79230 tp_is_empty!19951))

(declare-fun b!930333 () Bool)

(declare-fun mapRes!31683 () Bool)

(assert (=> b!930333 (= e!522413 (and e!522411 mapRes!31683))))

(declare-fun condMapEmpty!31683 () Bool)

(declare-fun mapDefault!31683 () ValueCell!9494)

