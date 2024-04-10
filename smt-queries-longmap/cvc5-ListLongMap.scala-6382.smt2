; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82044 () Bool)

(assert start!82044)

(declare-fun b_free!18451 () Bool)

(declare-fun b_next!18451 () Bool)

(assert (=> start!82044 (= b_free!18451 (not b_next!18451))))

(declare-fun tp!64164 () Bool)

(declare-fun b_and!29939 () Bool)

(assert (=> start!82044 (= tp!64164 b_and!29939)))

(declare-fun b!956815 () Bool)

(declare-fun res!640620 () Bool)

(declare-fun e!539184 () Bool)

(assert (=> b!956815 (=> (not res!640620) (not e!539184))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58233 0))(
  ( (array!58234 (arr!27995 (Array (_ BitVec 32) (_ BitVec 64))) (size!28474 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58233)

(assert (=> b!956815 (= res!640620 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28474 _keys!1441))))))

(declare-fun b!956816 () Bool)

(assert (=> b!956816 (= e!539184 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33073 0))(
  ( (V!33074 (val!10584 Int)) )
))
(declare-fun zeroValue!1139 () V!33073)

(declare-datatypes ((ValueCell!10052 0))(
  ( (ValueCellFull!10052 (v!13140 V!33073)) (EmptyCell!10052) )
))
(declare-datatypes ((array!58235 0))(
  ( (array!58236 (arr!27996 (Array (_ BitVec 32) ValueCell!10052)) (size!28475 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58235)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!33073)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13698 0))(
  ( (tuple2!13699 (_1!6860 (_ BitVec 64)) (_2!6860 V!33073)) )
))
(declare-datatypes ((List!19496 0))(
  ( (Nil!19493) (Cons!19492 (h!20654 tuple2!13698) (t!27859 List!19496)) )
))
(declare-datatypes ((ListLongMap!12395 0))(
  ( (ListLongMap!12396 (toList!6213 List!19496)) )
))
(declare-fun contains!5312 (ListLongMap!12395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3446 (array!58233 array!58235 (_ BitVec 32) (_ BitVec 32) V!33073 V!33073 (_ BitVec 32) Int) ListLongMap!12395)

(assert (=> b!956816 (contains!5312 (getCurrentListMap!3446 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27995 _keys!1441) i!735))))

(declare-datatypes ((Unit!32145 0))(
  ( (Unit!32146) )
))
(declare-fun lt!430256 () Unit!32145)

(declare-fun lemmaInListMapFromThenFromZero!25 (array!58233 array!58235 (_ BitVec 32) (_ BitVec 32) V!33073 V!33073 (_ BitVec 32) (_ BitVec 32) Int) Unit!32145)

(assert (=> b!956816 (= lt!430256 (lemmaInListMapFromThenFromZero!25 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956817 () Bool)

(declare-fun e!539182 () Bool)

(declare-fun tp_is_empty!21067 () Bool)

(assert (=> b!956817 (= e!539182 tp_is_empty!21067)))

(declare-fun res!640614 () Bool)

(assert (=> start!82044 (=> (not res!640614) (not e!539184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82044 (= res!640614 (validMask!0 mask!1823))))

(assert (=> start!82044 e!539184))

(assert (=> start!82044 true))

(assert (=> start!82044 tp_is_empty!21067))

(declare-fun array_inv!21719 (array!58233) Bool)

(assert (=> start!82044 (array_inv!21719 _keys!1441)))

(declare-fun e!539183 () Bool)

(declare-fun array_inv!21720 (array!58235) Bool)

(assert (=> start!82044 (and (array_inv!21720 _values!1197) e!539183)))

(assert (=> start!82044 tp!64164))

(declare-fun b!956818 () Bool)

(declare-fun res!640616 () Bool)

(assert (=> b!956818 (=> (not res!640616) (not e!539184))))

(assert (=> b!956818 (= res!640616 (contains!5312 (getCurrentListMap!3446 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27995 _keys!1441) i!735)))))

(declare-fun b!956819 () Bool)

(declare-fun res!640618 () Bool)

(assert (=> b!956819 (=> (not res!640618) (not e!539184))))

(declare-datatypes ((List!19497 0))(
  ( (Nil!19494) (Cons!19493 (h!20655 (_ BitVec 64)) (t!27860 List!19497)) )
))
(declare-fun arrayNoDuplicates!0 (array!58233 (_ BitVec 32) List!19497) Bool)

(assert (=> b!956819 (= res!640618 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19494))))

(declare-fun b!956820 () Bool)

(declare-fun e!539185 () Bool)

(declare-fun mapRes!33565 () Bool)

(assert (=> b!956820 (= e!539183 (and e!539185 mapRes!33565))))

(declare-fun condMapEmpty!33565 () Bool)

(declare-fun mapDefault!33565 () ValueCell!10052)

