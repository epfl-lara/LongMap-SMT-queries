; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35902 () Bool)

(assert start!35902)

(declare-fun b_free!7931 () Bool)

(declare-fun b_next!7931 () Bool)

(assert (=> start!35902 (= b_free!7931 (not b_next!7931))))

(declare-fun tp!28094 () Bool)

(declare-fun b_and!15173 () Bool)

(assert (=> start!35902 (= tp!28094 b_and!15173)))

(declare-fun mapNonEmpty!14019 () Bool)

(declare-fun mapRes!14019 () Bool)

(declare-fun tp!28095 () Bool)

(declare-fun e!220966 () Bool)

(assert (=> mapNonEmpty!14019 (= mapRes!14019 (and tp!28095 e!220966))))

(declare-fun mapKey!14019 () (_ BitVec 32))

(declare-datatypes ((V!12095 0))(
  ( (V!12096 (val!4214 Int)) )
))
(declare-datatypes ((ValueCell!3826 0))(
  ( (ValueCellFull!3826 (v!6408 V!12095)) (EmptyCell!3826) )
))
(declare-fun mapValue!14019 () ValueCell!3826)

(declare-datatypes ((array!20229 0))(
  ( (array!20230 (arr!9607 (Array (_ BitVec 32) ValueCell!3826)) (size!9959 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20229)

(declare-fun mapRest!14019 () (Array (_ BitVec 32) ValueCell!3826))

(assert (=> mapNonEmpty!14019 (= (arr!9607 _values!1208) (store mapRest!14019 mapKey!14019 mapValue!14019))))

(declare-fun b!360993 () Bool)

(declare-fun e!220961 () Bool)

(assert (=> b!360993 (= e!220961 true)))

(declare-fun minValue!1150 () V!12095)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!20231 0))(
  ( (array!20232 (arr!9608 (Array (_ BitVec 32) (_ BitVec 64))) (size!9960 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20231)

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12095)

(declare-datatypes ((tuple2!5738 0))(
  ( (tuple2!5739 (_1!2880 (_ BitVec 64)) (_2!2880 V!12095)) )
))
(declare-datatypes ((List!5500 0))(
  ( (Nil!5497) (Cons!5496 (h!6352 tuple2!5738) (t!10650 List!5500)) )
))
(declare-datatypes ((ListLongMap!4651 0))(
  ( (ListLongMap!4652 (toList!2341 List!5500)) )
))
(declare-fun contains!2422 (ListLongMap!4651 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1862 (array!20231 array!20229 (_ BitVec 32) (_ BitVec 32) V!12095 V!12095 (_ BitVec 32) Int) ListLongMap!4651)

(assert (=> b!360993 (contains!2422 (getCurrentListMap!1862 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k!1077)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((Unit!11106 0))(
  ( (Unit!11107) )
))
(declare-fun lt!166517 () Unit!11106)

(declare-fun lemmaArrayContainsKeyThenInListMap!355 (array!20231 array!20229 (_ BitVec 32) (_ BitVec 32) V!12095 V!12095 (_ BitVec 64) (_ BitVec 32) Int) Unit!11106)

(assert (=> b!360993 (= lt!166517 (lemmaArrayContainsKeyThenInListMap!355 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!360994 () Bool)

(declare-fun tp_is_empty!8339 () Bool)

(assert (=> b!360994 (= e!220966 tp_is_empty!8339)))

(declare-fun b!360995 () Bool)

(declare-fun res!200858 () Bool)

(declare-fun e!220963 () Bool)

(assert (=> b!360995 (=> (not res!200858) (not e!220963))))

(assert (=> b!360995 (= res!200858 (and (= (size!9959 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9960 _keys!1456) (size!9959 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360996 () Bool)

(declare-fun res!200851 () Bool)

(assert (=> b!360996 (=> (not res!200851) (not e!220963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20231 (_ BitVec 32)) Bool)

(assert (=> b!360996 (= res!200851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360997 () Bool)

(declare-fun res!200852 () Bool)

(assert (=> b!360997 (=> (not res!200852) (not e!220963))))

(declare-fun arrayContainsKey!0 (array!20231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360997 (= res!200852 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!360998 () Bool)

(assert (=> b!360998 (= e!220963 (not e!220961))))

(declare-fun res!200859 () Bool)

(assert (=> b!360998 (=> res!200859 e!220961)))

(assert (=> b!360998 (= res!200859 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9960 _keys!1456))))))

(assert (=> b!360998 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166516 () Unit!11106)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!67 (array!20231 array!20229 (_ BitVec 32) (_ BitVec 32) V!12095 V!12095 (_ BitVec 64) (_ BitVec 32)) Unit!11106)

(assert (=> b!360998 (= lt!166516 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!67 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!360999 () Bool)

(declare-fun res!200856 () Bool)

(assert (=> b!360999 (=> (not res!200856) (not e!220963))))

(declare-datatypes ((List!5501 0))(
  ( (Nil!5498) (Cons!5497 (h!6353 (_ BitVec 64)) (t!10651 List!5501)) )
))
(declare-fun arrayNoDuplicates!0 (array!20231 (_ BitVec 32) List!5501) Bool)

(assert (=> b!360999 (= res!200856 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5498))))

(declare-fun mapIsEmpty!14019 () Bool)

(assert (=> mapIsEmpty!14019 mapRes!14019))

(declare-fun b!361001 () Bool)

(declare-fun e!220965 () Bool)

(declare-fun e!220964 () Bool)

(assert (=> b!361001 (= e!220965 (and e!220964 mapRes!14019))))

(declare-fun condMapEmpty!14019 () Bool)

(declare-fun mapDefault!14019 () ValueCell!3826)

