; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79682 () Bool)

(assert start!79682)

(declare-fun b_free!17731 () Bool)

(declare-fun b_next!17731 () Bool)

(assert (=> start!79682 (= b_free!17731 (not b_next!17731))))

(declare-fun tp!61649 () Bool)

(declare-fun b_and!29053 () Bool)

(assert (=> start!79682 (= tp!61649 b_and!29053)))

(declare-fun b!937238 () Bool)

(declare-fun e!526292 () Bool)

(declare-fun tp_is_empty!20239 () Bool)

(assert (=> b!937238 (= e!526292 tp_is_empty!20239)))

(declare-fun b!937239 () Bool)

(declare-datatypes ((Unit!31636 0))(
  ( (Unit!31637) )
))
(declare-fun e!526296 () Unit!31636)

(declare-fun e!526288 () Unit!31636)

(assert (=> b!937239 (= e!526296 e!526288)))

(declare-fun lt!422855 () (_ BitVec 64))

(declare-datatypes ((array!56418 0))(
  ( (array!56419 (arr!27149 (Array (_ BitVec 32) (_ BitVec 64))) (size!27608 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56418)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!937239 (= lt!422855 (select (arr!27149 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97542 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937239 (= c!97542 (validKeyInArray!0 lt!422855))))

(declare-fun b!937240 () Bool)

(declare-fun res!630872 () Bool)

(declare-fun e!526294 () Bool)

(assert (=> b!937240 (=> (not res!630872) (not e!526294))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56418 (_ BitVec 32)) Bool)

(assert (=> b!937240 (= res!630872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937241 () Bool)

(declare-fun Unit!31638 () Unit!31636)

(assert (=> b!937241 (= e!526288 Unit!31638)))

(declare-fun mapIsEmpty!32130 () Bool)

(declare-fun mapRes!32130 () Bool)

(assert (=> mapIsEmpty!32130 mapRes!32130))

(declare-fun b!937242 () Bool)

(declare-fun Unit!31639 () Unit!31636)

(assert (=> b!937242 (= e!526296 Unit!31639)))

(declare-fun b!937243 () Bool)

(declare-fun res!630871 () Bool)

(assert (=> b!937243 (=> (not res!630871) (not e!526294))))

(assert (=> b!937243 (= res!630871 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27608 _keys!1487))))))

(declare-fun b!937244 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun e!526291 () Bool)

(declare-fun arrayContainsKey!0 (array!56418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937244 (= e!526291 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!937245 () Bool)

(declare-fun res!630869 () Bool)

(assert (=> b!937245 (=> (not res!630869) (not e!526294))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31951 0))(
  ( (V!31952 (val!10170 Int)) )
))
(declare-datatypes ((ValueCell!9638 0))(
  ( (ValueCellFull!9638 (v!12695 V!31951)) (EmptyCell!9638) )
))
(declare-datatypes ((array!56420 0))(
  ( (array!56421 (arr!27150 (Array (_ BitVec 32) ValueCell!9638)) (size!27609 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56420)

(assert (=> b!937245 (= res!630869 (and (= (size!27609 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27608 _keys!1487) (size!27609 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937246 () Bool)

(declare-fun e!526293 () Bool)

(declare-fun e!526290 () Bool)

(assert (=> b!937246 (= e!526293 (and e!526290 mapRes!32130))))

(declare-fun condMapEmpty!32130 () Bool)

(declare-fun mapDefault!32130 () ValueCell!9638)

