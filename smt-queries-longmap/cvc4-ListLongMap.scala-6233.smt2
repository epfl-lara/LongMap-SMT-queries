; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79674 () Bool)

(assert start!79674)

(declare-fun b_free!17723 () Bool)

(declare-fun b_next!17723 () Bool)

(assert (=> start!79674 (= b_free!17723 (not b_next!17723))))

(declare-fun tp!61624 () Bool)

(declare-fun b_and!29037 () Bool)

(assert (=> start!79674 (= tp!61624 b_and!29037)))

(declare-fun mapIsEmpty!32118 () Bool)

(declare-fun mapRes!32118 () Bool)

(assert (=> mapIsEmpty!32118 mapRes!32118))

(declare-fun mapNonEmpty!32118 () Bool)

(declare-fun tp!61625 () Bool)

(declare-fun e!526176 () Bool)

(assert (=> mapNonEmpty!32118 (= mapRes!32118 (and tp!61625 e!526176))))

(declare-datatypes ((V!31939 0))(
  ( (V!31940 (val!10166 Int)) )
))
(declare-datatypes ((ValueCell!9634 0))(
  ( (ValueCellFull!9634 (v!12691 V!31939)) (EmptyCell!9634) )
))
(declare-datatypes ((array!56402 0))(
  ( (array!56403 (arr!27141 (Array (_ BitVec 32) ValueCell!9634)) (size!27600 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56402)

(declare-fun mapValue!32118 () ValueCell!9634)

(declare-fun mapRest!32118 () (Array (_ BitVec 32) ValueCell!9634))

(declare-fun mapKey!32118 () (_ BitVec 32))

(assert (=> mapNonEmpty!32118 (= (arr!27141 _values!1231) (store mapRest!32118 mapKey!32118 mapValue!32118))))

(declare-fun b!937038 () Bool)

(declare-datatypes ((Unit!31620 0))(
  ( (Unit!31621) )
))
(declare-fun e!526170 () Unit!31620)

(declare-fun e!526169 () Unit!31620)

(assert (=> b!937038 (= e!526170 e!526169)))

(declare-fun lt!422701 () (_ BitVec 64))

(declare-datatypes ((array!56404 0))(
  ( (array!56405 (arr!27142 (Array (_ BitVec 32) (_ BitVec 64))) (size!27601 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56404)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!937038 (= lt!422701 (select (arr!27142 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97504 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937038 (= c!97504 (validKeyInArray!0 lt!422701))))

(declare-fun b!937039 () Bool)

(declare-fun e!526175 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937039 (= e!526175 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!937040 () Bool)

(declare-fun e!526171 () Bool)

(assert (=> b!937040 (= e!526171 false)))

(declare-fun lt!422690 () Unit!31620)

(assert (=> b!937040 (= lt!422690 e!526170)))

(declare-fun c!97506 () Bool)

(assert (=> b!937040 (= c!97506 (validKeyInArray!0 k!1099))))

(declare-fun b!937041 () Bool)

(declare-fun res!630790 () Bool)

(declare-fun e!526167 () Bool)

(assert (=> b!937041 (=> (not res!630790) (not e!526167))))

(assert (=> b!937041 (= res!630790 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27601 _keys!1487))))))

(declare-fun b!937042 () Bool)

(declare-fun Unit!31622 () Unit!31620)

(assert (=> b!937042 (= e!526170 Unit!31622)))

(declare-fun b!937043 () Bool)

(declare-fun res!630786 () Bool)

(assert (=> b!937043 (=> (not res!630786) (not e!526167))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!937043 (= res!630786 (and (= (size!27600 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27601 _keys!1487) (size!27600 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937044 () Bool)

(declare-fun Unit!31623 () Unit!31620)

(assert (=> b!937044 (= e!526169 Unit!31623)))

(declare-fun b!937045 () Bool)

(assert (=> b!937045 (= e!526175 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937046 () Bool)

(declare-fun e!526172 () Bool)

(declare-fun e!526168 () Bool)

(assert (=> b!937046 (= e!526172 (and e!526168 mapRes!32118))))

(declare-fun condMapEmpty!32118 () Bool)

(declare-fun mapDefault!32118 () ValueCell!9634)

