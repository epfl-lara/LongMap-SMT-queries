; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79652 () Bool)

(assert start!79652)

(declare-fun b_free!17701 () Bool)

(declare-fun b_next!17701 () Bool)

(assert (=> start!79652 (= b_free!17701 (not b_next!17701))))

(declare-fun tp!61559 () Bool)

(declare-fun b_and!28993 () Bool)

(assert (=> start!79652 (= tp!61559 b_and!28993)))

(declare-fun b!936489 () Bool)

(declare-datatypes ((Unit!31588 0))(
  ( (Unit!31589) )
))
(declare-fun e!525841 () Unit!31588)

(declare-fun Unit!31590 () Unit!31588)

(assert (=> b!936489 (= e!525841 Unit!31590)))

(declare-fun mapIsEmpty!32085 () Bool)

(declare-fun mapRes!32085 () Bool)

(assert (=> mapIsEmpty!32085 mapRes!32085))

(declare-fun b!936490 () Bool)

(declare-fun e!525846 () Bool)

(declare-fun tp_is_empty!20209 () Bool)

(assert (=> b!936490 (= e!525846 tp_is_empty!20209)))

(declare-fun b!936491 () Bool)

(declare-fun e!525844 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!936491 (= e!525844 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!936492 () Bool)

(declare-datatypes ((array!56358 0))(
  ( (array!56359 (arr!27119 (Array (_ BitVec 32) (_ BitVec 64))) (size!27578 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56358)

(declare-fun arrayContainsKey!0 (array!56358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936492 (= e!525844 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!936493 () Bool)

(declare-fun e!525840 () Unit!31588)

(declare-fun Unit!31591 () Unit!31588)

(assert (=> b!936493 (= e!525840 Unit!31591)))

(declare-fun mapNonEmpty!32085 () Bool)

(declare-fun tp!61558 () Bool)

(declare-fun e!525845 () Bool)

(assert (=> mapNonEmpty!32085 (= mapRes!32085 (and tp!61558 e!525845))))

(declare-fun mapKey!32085 () (_ BitVec 32))

(declare-datatypes ((V!31911 0))(
  ( (V!31912 (val!10155 Int)) )
))
(declare-datatypes ((ValueCell!9623 0))(
  ( (ValueCellFull!9623 (v!12680 V!31911)) (EmptyCell!9623) )
))
(declare-fun mapRest!32085 () (Array (_ BitVec 32) ValueCell!9623))

(declare-datatypes ((array!56360 0))(
  ( (array!56361 (arr!27120 (Array (_ BitVec 32) ValueCell!9623)) (size!27579 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56360)

(declare-fun mapValue!32085 () ValueCell!9623)

(assert (=> mapNonEmpty!32085 (= (arr!27120 _values!1231) (store mapRest!32085 mapKey!32085 mapValue!32085))))

(declare-fun b!936494 () Bool)

(declare-fun e!525843 () Bool)

(declare-fun e!525838 () Bool)

(assert (=> b!936494 (= e!525843 e!525838)))

(declare-fun res!630555 () Bool)

(assert (=> b!936494 (=> (not res!630555) (not e!525838))))

(declare-fun v!791 () V!31911)

(declare-fun lt!422263 () V!31911)

(assert (=> b!936494 (= res!630555 (and (= lt!422263 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13334 0))(
  ( (tuple2!13335 (_1!6678 (_ BitVec 64)) (_2!6678 V!31911)) )
))
(declare-datatypes ((List!19114 0))(
  ( (Nil!19111) (Cons!19110 (h!20256 tuple2!13334) (t!27359 List!19114)) )
))
(declare-datatypes ((ListLongMap!12031 0))(
  ( (ListLongMap!12032 (toList!6031 List!19114)) )
))
(declare-fun lt!422267 () ListLongMap!12031)

(declare-fun apply!833 (ListLongMap!12031 (_ BitVec 64)) V!31911)

(assert (=> b!936494 (= lt!422263 (apply!833 lt!422267 k!1099))))

(declare-fun b!936495 () Bool)

(declare-fun res!630554 () Bool)

(declare-fun e!525839 () Bool)

(assert (=> b!936495 (=> (not res!630554) (not e!525839))))

(declare-fun mask!1881 () (_ BitVec 32))

(assert (=> b!936495 (= res!630554 (and (= (size!27579 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27578 _keys!1487) (size!27579 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936488 () Bool)

(assert (=> b!936488 (= e!525839 e!525843)))

(declare-fun res!630553 () Bool)

(assert (=> b!936488 (=> (not res!630553) (not e!525843))))

(declare-fun contains!5091 (ListLongMap!12031 (_ BitVec 64)) Bool)

(assert (=> b!936488 (= res!630553 (contains!5091 lt!422267 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31911)

(declare-fun minValue!1173 () V!31911)

(declare-fun getCurrentListMap!3267 (array!56358 array!56360 (_ BitVec 32) (_ BitVec 32) V!31911 V!31911 (_ BitVec 32) Int) ListLongMap!12031)

(assert (=> b!936488 (= lt!422267 (getCurrentListMap!3267 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!630559 () Bool)

(assert (=> start!79652 (=> (not res!630559) (not e!525839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79652 (= res!630559 (validMask!0 mask!1881))))

(assert (=> start!79652 e!525839))

(assert (=> start!79652 true))

(assert (=> start!79652 tp_is_empty!20209))

(declare-fun e!525842 () Bool)

(declare-fun array_inv!21100 (array!56360) Bool)

(assert (=> start!79652 (and (array_inv!21100 _values!1231) e!525842)))

(assert (=> start!79652 tp!61559))

(declare-fun array_inv!21101 (array!56358) Bool)

(assert (=> start!79652 (array_inv!21101 _keys!1487)))

(declare-fun b!936496 () Bool)

(assert (=> b!936496 (= e!525845 tp_is_empty!20209)))

(declare-fun b!936497 () Bool)

(declare-fun res!630556 () Bool)

(assert (=> b!936497 (=> (not res!630556) (not e!525839))))

(declare-datatypes ((List!19115 0))(
  ( (Nil!19112) (Cons!19111 (h!20257 (_ BitVec 64)) (t!27360 List!19115)) )
))
(declare-fun arrayNoDuplicates!0 (array!56358 (_ BitVec 32) List!19115) Bool)

(assert (=> b!936497 (= res!630556 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19112))))

(declare-fun b!936498 () Bool)

(assert (=> b!936498 (= e!525842 (and e!525846 mapRes!32085))))

(declare-fun condMapEmpty!32085 () Bool)

(declare-fun mapDefault!32085 () ValueCell!9623)

