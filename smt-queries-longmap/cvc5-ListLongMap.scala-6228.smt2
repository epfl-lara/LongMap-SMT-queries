; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79640 () Bool)

(assert start!79640)

(declare-fun b_free!17689 () Bool)

(declare-fun b_next!17689 () Bool)

(assert (=> start!79640 (= b_free!17689 (not b_next!17689))))

(declare-fun tp!61523 () Bool)

(declare-fun b_and!28969 () Bool)

(assert (=> start!79640 (= tp!61523 b_and!28969)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!525676 () Bool)

(declare-fun b!936195 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!56336 0))(
  ( (array!56337 (arr!27108 (Array (_ BitVec 32) (_ BitVec 64))) (size!27567 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56336)

(declare-fun arrayContainsKey!0 (array!56336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936195 (= e!525676 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!936196 () Bool)

(declare-fun res!630410 () Bool)

(declare-fun e!525673 () Bool)

(assert (=> b!936196 (=> (not res!630410) (not e!525673))))

(assert (=> b!936196 (= res!630410 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27567 _keys!1487))))))

(declare-fun b!936197 () Bool)

(declare-fun e!525677 () Bool)

(declare-fun tp_is_empty!20197 () Bool)

(assert (=> b!936197 (= e!525677 tp_is_empty!20197)))

(declare-fun mapIsEmpty!32067 () Bool)

(declare-fun mapRes!32067 () Bool)

(assert (=> mapIsEmpty!32067 mapRes!32067))

(declare-fun b!936199 () Bool)

(declare-fun res!630406 () Bool)

(declare-fun e!525672 () Bool)

(assert (=> b!936199 (=> (not res!630406) (not e!525672))))

(declare-datatypes ((V!31895 0))(
  ( (V!31896 (val!10149 Int)) )
))
(declare-fun v!791 () V!31895)

(declare-datatypes ((tuple2!13326 0))(
  ( (tuple2!13327 (_1!6674 (_ BitVec 64)) (_2!6674 V!31895)) )
))
(declare-datatypes ((List!19107 0))(
  ( (Nil!19104) (Cons!19103 (h!20249 tuple2!13326) (t!27340 List!19107)) )
))
(declare-datatypes ((ListLongMap!12023 0))(
  ( (ListLongMap!12024 (toList!6027 List!19107)) )
))
(declare-fun lt!422055 () ListLongMap!12023)

(declare-fun apply!829 (ListLongMap!12023 (_ BitVec 64)) V!31895)

(assert (=> b!936199 (= res!630406 (= (apply!829 lt!422055 k!1099) v!791))))

(declare-fun b!936200 () Bool)

(declare-fun res!630411 () Bool)

(assert (=> b!936200 (=> (not res!630411) (not e!525672))))

(assert (=> b!936200 (= res!630411 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!936201 () Bool)

(declare-fun e!525671 () Bool)

(assert (=> b!936201 (= e!525671 tp_is_empty!20197)))

(declare-fun b!936202 () Bool)

(declare-fun res!630408 () Bool)

(assert (=> b!936202 (=> (not res!630408) (not e!525672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936202 (= res!630408 (validKeyInArray!0 k!1099))))

(declare-fun b!936203 () Bool)

(declare-fun res!630407 () Bool)

(assert (=> b!936203 (=> (not res!630407) (not e!525673))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56336 (_ BitVec 32)) Bool)

(assert (=> b!936203 (= res!630407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936204 () Bool)

(declare-fun e!525678 () Bool)

(assert (=> b!936204 (= e!525672 e!525678)))

(declare-fun res!630413 () Bool)

(assert (=> b!936204 (=> (not res!630413) (not e!525678))))

(declare-fun lt!422058 () (_ BitVec 64))

(assert (=> b!936204 (= res!630413 (validKeyInArray!0 lt!422058))))

(assert (=> b!936204 (= lt!422058 (select (arr!27108 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!32067 () Bool)

(declare-fun tp!61522 () Bool)

(assert (=> mapNonEmpty!32067 (= mapRes!32067 (and tp!61522 e!525677))))

(declare-datatypes ((ValueCell!9617 0))(
  ( (ValueCellFull!9617 (v!12674 V!31895)) (EmptyCell!9617) )
))
(declare-fun mapValue!32067 () ValueCell!9617)

(declare-datatypes ((array!56338 0))(
  ( (array!56339 (arr!27109 (Array (_ BitVec 32) ValueCell!9617)) (size!27568 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56338)

(declare-fun mapRest!32067 () (Array (_ BitVec 32) ValueCell!9617))

(declare-fun mapKey!32067 () (_ BitVec 32))

(assert (=> mapNonEmpty!32067 (= (arr!27109 _values!1231) (store mapRest!32067 mapKey!32067 mapValue!32067))))

(declare-fun b!936205 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!936205 (= e!525676 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936206 () Bool)

(declare-fun e!525675 () Bool)

(assert (=> b!936206 (= e!525675 (and e!525671 mapRes!32067))))

(declare-fun condMapEmpty!32067 () Bool)

(declare-fun mapDefault!32067 () ValueCell!9617)

