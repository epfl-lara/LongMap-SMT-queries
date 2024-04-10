; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79680 () Bool)

(assert start!79680)

(declare-fun b_free!17729 () Bool)

(declare-fun b_next!17729 () Bool)

(assert (=> start!79680 (= b_free!17729 (not b_next!17729))))

(declare-fun tp!61643 () Bool)

(declare-fun b_and!29049 () Bool)

(assert (=> start!79680 (= tp!61643 b_and!29049)))

(declare-fun mapNonEmpty!32127 () Bool)

(declare-fun mapRes!32127 () Bool)

(declare-fun tp!61642 () Bool)

(declare-fun e!526261 () Bool)

(assert (=> mapNonEmpty!32127 (= mapRes!32127 (and tp!61642 e!526261))))

(declare-datatypes ((V!31947 0))(
  ( (V!31948 (val!10169 Int)) )
))
(declare-datatypes ((ValueCell!9637 0))(
  ( (ValueCellFull!9637 (v!12694 V!31947)) (EmptyCell!9637) )
))
(declare-fun mapValue!32127 () ValueCell!9637)

(declare-fun mapRest!32127 () (Array (_ BitVec 32) ValueCell!9637))

(declare-fun mapKey!32127 () (_ BitVec 32))

(declare-datatypes ((array!56414 0))(
  ( (array!56415 (arr!27147 (Array (_ BitVec 32) ValueCell!9637)) (size!27606 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56414)

(assert (=> mapNonEmpty!32127 (= (arr!27147 _values!1231) (store mapRest!32127 mapKey!32127 mapValue!32127))))

(declare-fun b!937188 () Bool)

(declare-datatypes ((tuple2!13356 0))(
  ( (tuple2!13357 (_1!6689 (_ BitVec 64)) (_2!6689 V!31947)) )
))
(declare-datatypes ((List!19135 0))(
  ( (Nil!19132) (Cons!19131 (h!20277 tuple2!13356) (t!27408 List!19135)) )
))
(declare-datatypes ((ListLongMap!12053 0))(
  ( (ListLongMap!12054 (toList!6042 List!19135)) )
))
(declare-fun lt!422816 () ListLongMap!12053)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!422819 () V!31947)

(declare-fun apply!844 (ListLongMap!12053 (_ BitVec 64)) V!31947)

(assert (=> b!937188 (= (apply!844 lt!422816 k!1099) lt!422819)))

(declare-fun lt!422812 () (_ BitVec 64))

(declare-datatypes ((Unit!31632 0))(
  ( (Unit!31633) )
))
(declare-fun lt!422811 () Unit!31632)

(declare-fun lt!422808 () ListLongMap!12053)

(declare-fun lt!422809 () V!31947)

(declare-fun addApplyDifferent!430 (ListLongMap!12053 (_ BitVec 64) V!31947 (_ BitVec 64)) Unit!31632)

(assert (=> b!937188 (= lt!422811 (addApplyDifferent!430 lt!422808 lt!422812 lt!422809 k!1099))))

(assert (=> b!937188 (not (= lt!422812 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!422815 () Unit!31632)

(declare-datatypes ((array!56416 0))(
  ( (array!56417 (arr!27148 (Array (_ BitVec 32) (_ BitVec 64))) (size!27607 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56416)

(declare-datatypes ((List!19136 0))(
  ( (Nil!19133) (Cons!19132 (h!20278 (_ BitVec 64)) (t!27409 List!19136)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56416 (_ BitVec 64) (_ BitVec 32) List!19136) Unit!31632)

(assert (=> b!937188 (= lt!422815 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19133))))

(declare-fun e!526257 () Bool)

(assert (=> b!937188 e!526257))

(declare-fun c!97531 () Bool)

(assert (=> b!937188 (= c!97531 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!422817 () Unit!31632)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31947)

(declare-fun minValue!1173 () V!31947)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!303 (array!56416 array!56414 (_ BitVec 32) (_ BitVec 32) V!31947 V!31947 (_ BitVec 64) (_ BitVec 32) Int) Unit!31632)

(assert (=> b!937188 (= lt!422817 (lemmaListMapContainsThenArrayContainsFrom!303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56416 (_ BitVec 32) List!19136) Bool)

(assert (=> b!937188 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19133)))

(declare-fun lt!422807 () Unit!31632)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56416 (_ BitVec 32) (_ BitVec 32)) Unit!31632)

(assert (=> b!937188 (= lt!422807 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5101 (ListLongMap!12053 (_ BitVec 64)) Bool)

(assert (=> b!937188 (contains!5101 lt!422816 k!1099)))

(declare-fun lt!422814 () tuple2!13356)

(declare-fun +!2831 (ListLongMap!12053 tuple2!13356) ListLongMap!12053)

(assert (=> b!937188 (= lt!422816 (+!2831 lt!422808 lt!422814))))

(declare-fun lt!422813 () Unit!31632)

(declare-fun addStillContains!550 (ListLongMap!12053 (_ BitVec 64) V!31947 (_ BitVec 64)) Unit!31632)

(assert (=> b!937188 (= lt!422813 (addStillContains!550 lt!422808 lt!422812 lt!422809 k!1099))))

(declare-fun getCurrentListMap!3277 (array!56416 array!56414 (_ BitVec 32) (_ BitVec 32) V!31947 V!31947 (_ BitVec 32) Int) ListLongMap!12053)

(assert (=> b!937188 (= (getCurrentListMap!3277 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2831 (getCurrentListMap!3277 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422814))))

(assert (=> b!937188 (= lt!422814 (tuple2!13357 lt!422812 lt!422809))))

(declare-fun get!14311 (ValueCell!9637 V!31947) V!31947)

(declare-fun dynLambda!1620 (Int (_ BitVec 64)) V!31947)

(assert (=> b!937188 (= lt!422809 (get!14311 (select (arr!27147 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422818 () Unit!31632)

(declare-fun lemmaListMapRecursiveValidKeyArray!221 (array!56416 array!56414 (_ BitVec 32) (_ BitVec 32) V!31947 V!31947 (_ BitVec 32) Int) Unit!31632)

(assert (=> b!937188 (= lt!422818 (lemmaListMapRecursiveValidKeyArray!221 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526259 () Unit!31632)

(assert (=> b!937188 (= e!526259 lt!422811)))

(declare-fun b!937189 () Bool)

(declare-fun e!526258 () Bool)

(declare-fun tp_is_empty!20237 () Bool)

(assert (=> b!937189 (= e!526258 tp_is_empty!20237)))

(declare-fun b!937190 () Bool)

(assert (=> b!937190 (= e!526257 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937191 () Bool)

(declare-fun e!526262 () Bool)

(declare-fun e!526263 () Bool)

(assert (=> b!937191 (= e!526262 e!526263)))

(declare-fun res!630851 () Bool)

(assert (=> b!937191 (=> (not res!630851) (not e!526263))))

(declare-fun v!791 () V!31947)

(assert (=> b!937191 (= res!630851 (and (= lt!422819 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937191 (= lt!422819 (apply!844 lt!422808 k!1099))))

(declare-fun b!937192 () Bool)

(assert (=> b!937192 (= e!526263 false)))

(declare-fun lt!422810 () Unit!31632)

(declare-fun e!526260 () Unit!31632)

(assert (=> b!937192 (= lt!422810 e!526260)))

(declare-fun c!97533 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937192 (= c!97533 (validKeyInArray!0 k!1099))))

(declare-fun res!630853 () Bool)

(declare-fun e!526264 () Bool)

(assert (=> start!79680 (=> (not res!630853) (not e!526264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79680 (= res!630853 (validMask!0 mask!1881))))

(assert (=> start!79680 e!526264))

(assert (=> start!79680 true))

(assert (=> start!79680 tp_is_empty!20237))

(declare-fun e!526266 () Bool)

(declare-fun array_inv!21122 (array!56414) Bool)

(assert (=> start!79680 (and (array_inv!21122 _values!1231) e!526266)))

(assert (=> start!79680 tp!61643))

(declare-fun array_inv!21123 (array!56416) Bool)

(assert (=> start!79680 (array_inv!21123 _keys!1487)))

(declare-fun b!937193 () Bool)

(declare-fun Unit!31634 () Unit!31632)

(assert (=> b!937193 (= e!526260 Unit!31634)))

(declare-fun b!937194 () Bool)

(declare-fun res!630848 () Bool)

(assert (=> b!937194 (=> (not res!630848) (not e!526264))))

(assert (=> b!937194 (= res!630848 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19133))))

(declare-fun b!937195 () Bool)

(declare-fun Unit!31635 () Unit!31632)

(assert (=> b!937195 (= e!526259 Unit!31635)))

(declare-fun b!937196 () Bool)

(declare-fun arrayContainsKey!0 (array!56416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937196 (= e!526257 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!937197 () Bool)

(declare-fun res!630849 () Bool)

(assert (=> b!937197 (=> (not res!630849) (not e!526264))))

(assert (=> b!937197 (= res!630849 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27607 _keys!1487))))))

(declare-fun b!937198 () Bool)

(declare-fun res!630847 () Bool)

(assert (=> b!937198 (=> (not res!630847) (not e!526264))))

(assert (=> b!937198 (= res!630847 (and (= (size!27606 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27607 _keys!1487) (size!27606 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937199 () Bool)

(assert (=> b!937199 (= e!526264 e!526262)))

(declare-fun res!630850 () Bool)

(assert (=> b!937199 (=> (not res!630850) (not e!526262))))

(assert (=> b!937199 (= res!630850 (contains!5101 lt!422808 k!1099))))

(assert (=> b!937199 (= lt!422808 (getCurrentListMap!3277 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!32127 () Bool)

(assert (=> mapIsEmpty!32127 mapRes!32127))

(declare-fun b!937200 () Bool)

(assert (=> b!937200 (= e!526260 e!526259)))

(assert (=> b!937200 (= lt!422812 (select (arr!27148 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97532 () Bool)

(assert (=> b!937200 (= c!97532 (validKeyInArray!0 lt!422812))))

(declare-fun b!937201 () Bool)

(declare-fun res!630852 () Bool)

(assert (=> b!937201 (=> (not res!630852) (not e!526264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56416 (_ BitVec 32)) Bool)

(assert (=> b!937201 (= res!630852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937202 () Bool)

(assert (=> b!937202 (= e!526266 (and e!526258 mapRes!32127))))

(declare-fun condMapEmpty!32127 () Bool)

(declare-fun mapDefault!32127 () ValueCell!9637)

