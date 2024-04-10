; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79626 () Bool)

(assert start!79626)

(declare-fun b_free!17675 () Bool)

(declare-fun b_next!17675 () Bool)

(assert (=> start!79626 (= b_free!17675 (not b_next!17675))))

(declare-fun tp!61480 () Bool)

(declare-fun b_and!28941 () Bool)

(assert (=> start!79626 (= tp!61480 b_and!28941)))

(declare-fun b!935863 () Bool)

(declare-fun e!525503 () Bool)

(declare-fun tp_is_empty!20183 () Bool)

(assert (=> b!935863 (= e!525503 tp_is_empty!20183)))

(declare-fun b!935864 () Bool)

(declare-fun e!525505 () Bool)

(assert (=> b!935864 (= e!525505 tp_is_empty!20183)))

(declare-fun b!935865 () Bool)

(declare-fun e!525506 () Bool)

(declare-fun e!525509 () Bool)

(assert (=> b!935865 (= e!525506 e!525509)))

(declare-fun res!630197 () Bool)

(assert (=> b!935865 (=> (not res!630197) (not e!525509))))

(declare-datatypes ((V!31875 0))(
  ( (V!31876 (val!10142 Int)) )
))
(declare-datatypes ((tuple2!13312 0))(
  ( (tuple2!13313 (_1!6667 (_ BitVec 64)) (_2!6667 V!31875)) )
))
(declare-datatypes ((List!19093 0))(
  ( (Nil!19090) (Cons!19089 (h!20235 tuple2!13312) (t!27312 List!19093)) )
))
(declare-datatypes ((ListLongMap!12009 0))(
  ( (ListLongMap!12010 (toList!6020 List!19093)) )
))
(declare-fun lt!421872 () ListLongMap!12009)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5080 (ListLongMap!12009 (_ BitVec 64)) Bool)

(assert (=> b!935865 (= res!630197 (contains!5080 lt!421872 k!1099))))

(declare-datatypes ((array!56308 0))(
  ( (array!56309 (arr!27094 (Array (_ BitVec 32) (_ BitVec 64))) (size!27553 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56308)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9610 0))(
  ( (ValueCellFull!9610 (v!12667 V!31875)) (EmptyCell!9610) )
))
(declare-datatypes ((array!56310 0))(
  ( (array!56311 (arr!27095 (Array (_ BitVec 32) ValueCell!9610)) (size!27554 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56310)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31875)

(declare-fun minValue!1173 () V!31875)

(declare-fun getCurrentListMap!3257 (array!56308 array!56310 (_ BitVec 32) (_ BitVec 32) V!31875 V!31875 (_ BitVec 32) Int) ListLongMap!12009)

(assert (=> b!935865 (= lt!421872 (getCurrentListMap!3257 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935866 () Bool)

(declare-fun res!630201 () Bool)

(assert (=> b!935866 (=> (not res!630201) (not e!525506))))

(assert (=> b!935866 (= res!630201 (and (= (size!27554 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27553 _keys!1487) (size!27554 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935867 () Bool)

(declare-fun res!630194 () Bool)

(assert (=> b!935867 (=> (not res!630194) (not e!525509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935867 (= res!630194 (validKeyInArray!0 k!1099))))

(declare-fun mapIsEmpty!32046 () Bool)

(declare-fun mapRes!32046 () Bool)

(assert (=> mapIsEmpty!32046 mapRes!32046))

(declare-fun b!935868 () Bool)

(declare-fun e!525502 () Bool)

(assert (=> b!935868 (= e!525502 true)))

(declare-fun lt!421867 () Bool)

(declare-datatypes ((List!19094 0))(
  ( (Nil!19091) (Cons!19090 (h!20236 (_ BitVec 64)) (t!27313 List!19094)) )
))
(declare-fun contains!5081 (List!19094 (_ BitVec 64)) Bool)

(assert (=> b!935868 (= lt!421867 (contains!5081 Nil!19091 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935869 () Bool)

(declare-fun res!630202 () Bool)

(assert (=> b!935869 (=> (not res!630202) (not e!525509))))

(assert (=> b!935869 (= res!630202 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935870 () Bool)

(declare-fun e!525510 () Bool)

(assert (=> b!935870 (= e!525509 e!525510)))

(declare-fun res!630199 () Bool)

(assert (=> b!935870 (=> (not res!630199) (not e!525510))))

(declare-fun lt!421866 () (_ BitVec 64))

(assert (=> b!935870 (= res!630199 (validKeyInArray!0 lt!421866))))

(assert (=> b!935870 (= lt!421866 (select (arr!27094 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935871 () Bool)

(declare-fun res!630200 () Bool)

(assert (=> b!935871 (=> (not res!630200) (not e!525506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56308 (_ BitVec 32)) Bool)

(assert (=> b!935871 (= res!630200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935872 () Bool)

(declare-fun res!630204 () Bool)

(assert (=> b!935872 (=> (not res!630204) (not e!525506))))

(assert (=> b!935872 (= res!630204 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27553 _keys!1487))))))

(declare-fun b!935873 () Bool)

(declare-fun res!630193 () Bool)

(assert (=> b!935873 (=> (not res!630193) (not e!525506))))

(declare-fun arrayNoDuplicates!0 (array!56308 (_ BitVec 32) List!19094) Bool)

(assert (=> b!935873 (= res!630193 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19091))))

(declare-fun b!935874 () Bool)

(declare-fun res!630198 () Bool)

(assert (=> b!935874 (=> res!630198 e!525502)))

(assert (=> b!935874 (= res!630198 (contains!5081 Nil!19091 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!32046 () Bool)

(declare-fun tp!61481 () Bool)

(assert (=> mapNonEmpty!32046 (= mapRes!32046 (and tp!61481 e!525503))))

(declare-fun mapValue!32046 () ValueCell!9610)

(declare-fun mapRest!32046 () (Array (_ BitVec 32) ValueCell!9610))

(declare-fun mapKey!32046 () (_ BitVec 32))

(assert (=> mapNonEmpty!32046 (= (arr!27095 _values!1231) (store mapRest!32046 mapKey!32046 mapValue!32046))))

(declare-fun b!935876 () Bool)

(declare-fun e!525508 () Bool)

(assert (=> b!935876 (= e!525508 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935877 () Bool)

(declare-fun res!630205 () Bool)

(assert (=> b!935877 (=> (not res!630205) (not e!525509))))

(declare-fun v!791 () V!31875)

(declare-fun apply!822 (ListLongMap!12009 (_ BitVec 64)) V!31875)

(assert (=> b!935877 (= res!630205 (= (apply!822 lt!421872 k!1099) v!791))))

(declare-fun b!935878 () Bool)

(declare-fun arrayContainsKey!0 (array!56308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935878 (= e!525508 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!935879 () Bool)

(declare-fun res!630196 () Bool)

(assert (=> b!935879 (=> res!630196 e!525502)))

(declare-fun noDuplicate!1356 (List!19094) Bool)

(assert (=> b!935879 (= res!630196 (not (noDuplicate!1356 Nil!19091)))))

(declare-fun b!935880 () Bool)

(declare-fun e!525504 () Bool)

(assert (=> b!935880 (= e!525504 (and e!525505 mapRes!32046))))

(declare-fun condMapEmpty!32046 () Bool)

(declare-fun mapDefault!32046 () ValueCell!9610)

