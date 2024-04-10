; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81886 () Bool)

(assert start!81886)

(declare-fun b_free!18381 () Bool)

(declare-fun b_next!18381 () Bool)

(assert (=> start!81886 (= b_free!18381 (not b_next!18381))))

(declare-fun tp!63843 () Bool)

(declare-fun b_and!29867 () Bool)

(assert (=> start!81886 (= tp!63843 b_and!29867)))

(declare-fun b!955021 () Bool)

(declare-fun res!639528 () Bool)

(declare-fun e!538048 () Bool)

(assert (=> b!955021 (=> (not res!639528) (not e!538048))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57957 0))(
  ( (array!57958 (arr!27858 (Array (_ BitVec 32) (_ BitVec 64))) (size!28337 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57957)

(declare-datatypes ((V!32883 0))(
  ( (V!32884 (val!10513 Int)) )
))
(declare-datatypes ((ValueCell!9981 0))(
  ( (ValueCellFull!9981 (v!13068 V!32883)) (EmptyCell!9981) )
))
(declare-datatypes ((array!57959 0))(
  ( (array!57960 (arr!27859 (Array (_ BitVec 32) ValueCell!9981)) (size!28338 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57959)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955021 (= res!639528 (and (= (size!28338 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28337 _keys!1441) (size!28338 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955022 () Bool)

(assert (=> b!955022 (= e!538048 false)))

(declare-fun zeroValue!1139 () V!32883)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun lt!429965 () Bool)

(declare-fun minValue!1139 () V!32883)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13640 0))(
  ( (tuple2!13641 (_1!6831 (_ BitVec 64)) (_2!6831 V!32883)) )
))
(declare-datatypes ((List!19416 0))(
  ( (Nil!19413) (Cons!19412 (h!20574 tuple2!13640) (t!27777 List!19416)) )
))
(declare-datatypes ((ListLongMap!12337 0))(
  ( (ListLongMap!12338 (toList!6184 List!19416)) )
))
(declare-fun contains!5282 (ListLongMap!12337 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3417 (array!57957 array!57959 (_ BitVec 32) (_ BitVec 32) V!32883 V!32883 (_ BitVec 32) Int) ListLongMap!12337)

(assert (=> b!955022 (= lt!429965 (contains!5282 (getCurrentListMap!3417 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27858 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33349 () Bool)

(declare-fun mapRes!33349 () Bool)

(declare-fun tp!63842 () Bool)

(declare-fun e!538046 () Bool)

(assert (=> mapNonEmpty!33349 (= mapRes!33349 (and tp!63842 e!538046))))

(declare-fun mapValue!33349 () ValueCell!9981)

(declare-fun mapRest!33349 () (Array (_ BitVec 32) ValueCell!9981))

(declare-fun mapKey!33349 () (_ BitVec 32))

(assert (=> mapNonEmpty!33349 (= (arr!27859 _values!1197) (store mapRest!33349 mapKey!33349 mapValue!33349))))

(declare-fun b!955023 () Bool)

(declare-fun res!639524 () Bool)

(assert (=> b!955023 (=> (not res!639524) (not e!538048))))

(assert (=> b!955023 (= res!639524 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28337 _keys!1441))))))

(declare-fun b!955024 () Bool)

(declare-fun res!639526 () Bool)

(assert (=> b!955024 (=> (not res!639526) (not e!538048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955024 (= res!639526 (validKeyInArray!0 (select (arr!27858 _keys!1441) i!735)))))

(declare-fun b!955025 () Bool)

(declare-fun e!538047 () Bool)

(declare-fun e!538044 () Bool)

(assert (=> b!955025 (= e!538047 (and e!538044 mapRes!33349))))

(declare-fun condMapEmpty!33349 () Bool)

(declare-fun mapDefault!33349 () ValueCell!9981)

(assert (=> b!955025 (= condMapEmpty!33349 (= (arr!27859 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9981)) mapDefault!33349)))))

(declare-fun mapIsEmpty!33349 () Bool)

(assert (=> mapIsEmpty!33349 mapRes!33349))

(declare-fun res!639527 () Bool)

(assert (=> start!81886 (=> (not res!639527) (not e!538048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81886 (= res!639527 (validMask!0 mask!1823))))

(assert (=> start!81886 e!538048))

(assert (=> start!81886 true))

(declare-fun tp_is_empty!20925 () Bool)

(assert (=> start!81886 tp_is_empty!20925))

(declare-fun array_inv!21623 (array!57957) Bool)

(assert (=> start!81886 (array_inv!21623 _keys!1441)))

(declare-fun array_inv!21624 (array!57959) Bool)

(assert (=> start!81886 (and (array_inv!21624 _values!1197) e!538047)))

(assert (=> start!81886 tp!63843))

(declare-fun b!955026 () Bool)

(declare-fun res!639523 () Bool)

(assert (=> b!955026 (=> (not res!639523) (not e!538048))))

(declare-datatypes ((List!19417 0))(
  ( (Nil!19414) (Cons!19413 (h!20575 (_ BitVec 64)) (t!27778 List!19417)) )
))
(declare-fun arrayNoDuplicates!0 (array!57957 (_ BitVec 32) List!19417) Bool)

(assert (=> b!955026 (= res!639523 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19414))))

(declare-fun b!955027 () Bool)

(assert (=> b!955027 (= e!538046 tp_is_empty!20925)))

(declare-fun b!955028 () Bool)

(declare-fun res!639525 () Bool)

(assert (=> b!955028 (=> (not res!639525) (not e!538048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57957 (_ BitVec 32)) Bool)

(assert (=> b!955028 (= res!639525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955029 () Bool)

(assert (=> b!955029 (= e!538044 tp_is_empty!20925)))

(assert (= (and start!81886 res!639527) b!955021))

(assert (= (and b!955021 res!639528) b!955028))

(assert (= (and b!955028 res!639525) b!955026))

(assert (= (and b!955026 res!639523) b!955023))

(assert (= (and b!955023 res!639524) b!955024))

(assert (= (and b!955024 res!639526) b!955022))

(assert (= (and b!955025 condMapEmpty!33349) mapIsEmpty!33349))

(assert (= (and b!955025 (not condMapEmpty!33349)) mapNonEmpty!33349))

(get-info :version)

(assert (= (and mapNonEmpty!33349 ((_ is ValueCellFull!9981) mapValue!33349)) b!955027))

(assert (= (and b!955025 ((_ is ValueCellFull!9981) mapDefault!33349)) b!955029))

(assert (= start!81886 b!955025))

(declare-fun m!886603 () Bool)

(assert (=> b!955024 m!886603))

(assert (=> b!955024 m!886603))

(declare-fun m!886605 () Bool)

(assert (=> b!955024 m!886605))

(declare-fun m!886607 () Bool)

(assert (=> b!955026 m!886607))

(declare-fun m!886609 () Bool)

(assert (=> start!81886 m!886609))

(declare-fun m!886611 () Bool)

(assert (=> start!81886 m!886611))

(declare-fun m!886613 () Bool)

(assert (=> start!81886 m!886613))

(declare-fun m!886615 () Bool)

(assert (=> mapNonEmpty!33349 m!886615))

(declare-fun m!886617 () Bool)

(assert (=> b!955028 m!886617))

(declare-fun m!886619 () Bool)

(assert (=> b!955022 m!886619))

(assert (=> b!955022 m!886603))

(assert (=> b!955022 m!886619))

(assert (=> b!955022 m!886603))

(declare-fun m!886621 () Bool)

(assert (=> b!955022 m!886621))

(check-sat (not b!955028) (not b!955026) (not b_next!18381) tp_is_empty!20925 (not b!955024) (not start!81886) (not b!955022) (not mapNonEmpty!33349) b_and!29867)
(check-sat b_and!29867 (not b_next!18381))
