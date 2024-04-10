; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81910 () Bool)

(assert start!81910)

(declare-fun b_free!18405 () Bool)

(declare-fun b_next!18405 () Bool)

(assert (=> start!81910 (= b_free!18405 (not b_next!18405))))

(declare-fun tp!63915 () Bool)

(declare-fun b_and!29891 () Bool)

(assert (=> start!81910 (= tp!63915 b_and!29891)))

(declare-fun b!955377 () Bool)

(declare-fun e!538227 () Bool)

(declare-fun tp_is_empty!20949 () Bool)

(assert (=> b!955377 (= e!538227 tp_is_empty!20949)))

(declare-fun b!955378 () Bool)

(declare-fun e!538228 () Bool)

(assert (=> b!955378 (= e!538228 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32915 0))(
  ( (V!32916 (val!10525 Int)) )
))
(declare-fun zeroValue!1139 () V!32915)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58003 0))(
  ( (array!58004 (arr!27881 (Array (_ BitVec 32) (_ BitVec 64))) (size!28360 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58003)

(declare-datatypes ((ValueCell!9993 0))(
  ( (ValueCellFull!9993 (v!13080 V!32915)) (EmptyCell!9993) )
))
(declare-datatypes ((array!58005 0))(
  ( (array!58006 (arr!27882 (Array (_ BitVec 32) ValueCell!9993)) (size!28361 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58005)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32915)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13656 0))(
  ( (tuple2!13657 (_1!6839 (_ BitVec 64)) (_2!6839 V!32915)) )
))
(declare-datatypes ((List!19431 0))(
  ( (Nil!19428) (Cons!19427 (h!20589 tuple2!13656) (t!27792 List!19431)) )
))
(declare-datatypes ((ListLongMap!12353 0))(
  ( (ListLongMap!12354 (toList!6192 List!19431)) )
))
(declare-fun contains!5290 (ListLongMap!12353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3425 (array!58003 array!58005 (_ BitVec 32) (_ BitVec 32) V!32915 V!32915 (_ BitVec 32) Int) ListLongMap!12353)

(assert (=> b!955378 (contains!5290 (getCurrentListMap!3425 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27881 _keys!1441) i!735))))

(declare-datatypes ((Unit!32105 0))(
  ( (Unit!32106) )
))
(declare-fun lt!430001 () Unit!32105)

(declare-fun lemmaInListMapFromThenFromZero!7 (array!58003 array!58005 (_ BitVec 32) (_ BitVec 32) V!32915 V!32915 (_ BitVec 32) (_ BitVec 32) Int) Unit!32105)

(assert (=> b!955378 (= lt!430001 (lemmaInListMapFromThenFromZero!7 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955379 () Bool)

(declare-fun res!639774 () Bool)

(assert (=> b!955379 (=> (not res!639774) (not e!538228))))

(assert (=> b!955379 (= res!639774 (and (= (size!28361 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28360 _keys!1441) (size!28361 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955380 () Bool)

(declare-fun e!538225 () Bool)

(assert (=> b!955380 (= e!538225 tp_is_empty!20949)))

(declare-fun b!955381 () Bool)

(declare-fun res!639772 () Bool)

(assert (=> b!955381 (=> (not res!639772) (not e!538228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58003 (_ BitVec 32)) Bool)

(assert (=> b!955381 (= res!639772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!639771 () Bool)

(assert (=> start!81910 (=> (not res!639771) (not e!538228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81910 (= res!639771 (validMask!0 mask!1823))))

(assert (=> start!81910 e!538228))

(assert (=> start!81910 true))

(assert (=> start!81910 tp_is_empty!20949))

(declare-fun array_inv!21639 (array!58003) Bool)

(assert (=> start!81910 (array_inv!21639 _keys!1441)))

(declare-fun e!538226 () Bool)

(declare-fun array_inv!21640 (array!58005) Bool)

(assert (=> start!81910 (and (array_inv!21640 _values!1197) e!538226)))

(assert (=> start!81910 tp!63915))

(declare-fun b!955382 () Bool)

(declare-fun mapRes!33385 () Bool)

(assert (=> b!955382 (= e!538226 (and e!538225 mapRes!33385))))

(declare-fun condMapEmpty!33385 () Bool)

(declare-fun mapDefault!33385 () ValueCell!9993)

(assert (=> b!955382 (= condMapEmpty!33385 (= (arr!27882 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9993)) mapDefault!33385)))))

(declare-fun mapIsEmpty!33385 () Bool)

(assert (=> mapIsEmpty!33385 mapRes!33385))

(declare-fun b!955383 () Bool)

(declare-fun res!639776 () Bool)

(assert (=> b!955383 (=> (not res!639776) (not e!538228))))

(assert (=> b!955383 (= res!639776 (contains!5290 (getCurrentListMap!3425 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27881 _keys!1441) i!735)))))

(declare-fun b!955384 () Bool)

(declare-fun res!639775 () Bool)

(assert (=> b!955384 (=> (not res!639775) (not e!538228))))

(assert (=> b!955384 (= res!639775 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28360 _keys!1441))))))

(declare-fun b!955385 () Bool)

(declare-fun res!639773 () Bool)

(assert (=> b!955385 (=> (not res!639773) (not e!538228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955385 (= res!639773 (validKeyInArray!0 (select (arr!27881 _keys!1441) i!735)))))

(declare-fun b!955386 () Bool)

(declare-fun res!639777 () Bool)

(assert (=> b!955386 (=> (not res!639777) (not e!538228))))

(declare-datatypes ((List!19432 0))(
  ( (Nil!19429) (Cons!19428 (h!20590 (_ BitVec 64)) (t!27793 List!19432)) )
))
(declare-fun arrayNoDuplicates!0 (array!58003 (_ BitVec 32) List!19432) Bool)

(assert (=> b!955386 (= res!639777 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19429))))

(declare-fun mapNonEmpty!33385 () Bool)

(declare-fun tp!63914 () Bool)

(assert (=> mapNonEmpty!33385 (= mapRes!33385 (and tp!63914 e!538227))))

(declare-fun mapKey!33385 () (_ BitVec 32))

(declare-fun mapRest!33385 () (Array (_ BitVec 32) ValueCell!9993))

(declare-fun mapValue!33385 () ValueCell!9993)

(assert (=> mapNonEmpty!33385 (= (arr!27882 _values!1197) (store mapRest!33385 mapKey!33385 mapValue!33385))))

(assert (= (and start!81910 res!639771) b!955379))

(assert (= (and b!955379 res!639774) b!955381))

(assert (= (and b!955381 res!639772) b!955386))

(assert (= (and b!955386 res!639777) b!955384))

(assert (= (and b!955384 res!639775) b!955385))

(assert (= (and b!955385 res!639773) b!955383))

(assert (= (and b!955383 res!639776) b!955378))

(assert (= (and b!955382 condMapEmpty!33385) mapIsEmpty!33385))

(assert (= (and b!955382 (not condMapEmpty!33385)) mapNonEmpty!33385))

(get-info :version)

(assert (= (and mapNonEmpty!33385 ((_ is ValueCellFull!9993) mapValue!33385)) b!955377))

(assert (= (and b!955382 ((_ is ValueCellFull!9993) mapDefault!33385)) b!955380))

(assert (= start!81910 b!955382))

(declare-fun m!886903 () Bool)

(assert (=> b!955381 m!886903))

(declare-fun m!886905 () Bool)

(assert (=> start!81910 m!886905))

(declare-fun m!886907 () Bool)

(assert (=> start!81910 m!886907))

(declare-fun m!886909 () Bool)

(assert (=> start!81910 m!886909))

(declare-fun m!886911 () Bool)

(assert (=> b!955378 m!886911))

(declare-fun m!886913 () Bool)

(assert (=> b!955378 m!886913))

(assert (=> b!955378 m!886911))

(assert (=> b!955378 m!886913))

(declare-fun m!886915 () Bool)

(assert (=> b!955378 m!886915))

(declare-fun m!886917 () Bool)

(assert (=> b!955378 m!886917))

(declare-fun m!886919 () Bool)

(assert (=> b!955383 m!886919))

(assert (=> b!955383 m!886913))

(assert (=> b!955383 m!886919))

(assert (=> b!955383 m!886913))

(declare-fun m!886921 () Bool)

(assert (=> b!955383 m!886921))

(declare-fun m!886923 () Bool)

(assert (=> mapNonEmpty!33385 m!886923))

(declare-fun m!886925 () Bool)

(assert (=> b!955386 m!886925))

(assert (=> b!955385 m!886913))

(assert (=> b!955385 m!886913))

(declare-fun m!886927 () Bool)

(assert (=> b!955385 m!886927))

(check-sat (not b!955383) (not start!81910) (not b!955386) tp_is_empty!20949 (not mapNonEmpty!33385) (not b!955378) (not b!955381) (not b!955385) (not b_next!18405) b_and!29891)
(check-sat b_and!29891 (not b_next!18405))
