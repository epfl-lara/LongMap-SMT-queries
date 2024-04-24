; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82720 () Bool)

(assert start!82720)

(declare-fun b_free!18685 () Bool)

(declare-fun b_next!18685 () Bool)

(assert (=> start!82720 (= b_free!18685 (not b_next!18685))))

(declare-fun tp!65175 () Bool)

(declare-fun b_and!30183 () Bool)

(assert (=> start!82720 (= tp!65175 b_and!30183)))

(declare-fun b!962936 () Bool)

(declare-fun e!543105 () Bool)

(declare-fun e!543106 () Bool)

(declare-fun mapRes!34225 () Bool)

(assert (=> b!962936 (= e!543105 (and e!543106 mapRes!34225))))

(declare-fun condMapEmpty!34225 () Bool)

(declare-datatypes ((V!33633 0))(
  ( (V!33634 (val!10794 Int)) )
))
(declare-datatypes ((ValueCell!10262 0))(
  ( (ValueCellFull!10262 (v!13349 V!33633)) (EmptyCell!10262) )
))
(declare-datatypes ((array!59092 0))(
  ( (array!59093 (arr!28410 (Array (_ BitVec 32) ValueCell!10262)) (size!28890 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59092)

(declare-fun mapDefault!34225 () ValueCell!10262)

(assert (=> b!962936 (= condMapEmpty!34225 (= (arr!28410 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10262)) mapDefault!34225)))))

(declare-fun b!962937 () Bool)

(declare-fun e!543104 () Bool)

(assert (=> b!962937 (= e!543104 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59094 0))(
  ( (array!59095 (arr!28411 (Array (_ BitVec 32) (_ BitVec 64))) (size!28891 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59094)

(declare-fun minValue!1342 () V!33633)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431192 () Bool)

(declare-fun zeroValue!1342 () V!33633)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13842 0))(
  ( (tuple2!13843 (_1!6932 (_ BitVec 64)) (_2!6932 V!33633)) )
))
(declare-datatypes ((List!19694 0))(
  ( (Nil!19691) (Cons!19690 (h!20858 tuple2!13842) (t!28049 List!19694)) )
))
(declare-datatypes ((ListLongMap!12541 0))(
  ( (ListLongMap!12542 (toList!6286 List!19694)) )
))
(declare-fun contains!5401 (ListLongMap!12541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3519 (array!59094 array!59092 (_ BitVec 32) (_ BitVec 32) V!33633 V!33633 (_ BitVec 32) Int) ListLongMap!12541)

(assert (=> b!962937 (= lt!431192 (contains!5401 (getCurrentListMap!3519 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28411 _keys!1686) i!803)))))

(declare-fun b!962938 () Bool)

(declare-fun e!543107 () Bool)

(declare-fun tp_is_empty!21487 () Bool)

(assert (=> b!962938 (= e!543107 tp_is_empty!21487)))

(declare-fun b!962939 () Bool)

(declare-fun res!644162 () Bool)

(assert (=> b!962939 (=> (not res!644162) (not e!543104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962939 (= res!644162 (validKeyInArray!0 (select (arr!28411 _keys!1686) i!803)))))

(declare-fun b!962940 () Bool)

(declare-fun res!644158 () Bool)

(assert (=> b!962940 (=> (not res!644158) (not e!543104))))

(declare-datatypes ((List!19695 0))(
  ( (Nil!19692) (Cons!19691 (h!20859 (_ BitVec 64)) (t!28050 List!19695)) )
))
(declare-fun arrayNoDuplicates!0 (array!59094 (_ BitVec 32) List!19695) Bool)

(assert (=> b!962940 (= res!644158 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19692))))

(declare-fun b!962941 () Bool)

(declare-fun res!644161 () Bool)

(assert (=> b!962941 (=> (not res!644161) (not e!543104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59094 (_ BitVec 32)) Bool)

(assert (=> b!962941 (= res!644161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962942 () Bool)

(declare-fun res!644159 () Bool)

(assert (=> b!962942 (=> (not res!644159) (not e!543104))))

(assert (=> b!962942 (= res!644159 (and (= (size!28890 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28891 _keys!1686) (size!28890 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962943 () Bool)

(declare-fun res!644163 () Bool)

(assert (=> b!962943 (=> (not res!644163) (not e!543104))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962943 (= res!644163 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28891 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28891 _keys!1686))))))

(declare-fun b!962944 () Bool)

(assert (=> b!962944 (= e!543106 tp_is_empty!21487)))

(declare-fun mapIsEmpty!34225 () Bool)

(assert (=> mapIsEmpty!34225 mapRes!34225))

(declare-fun res!644160 () Bool)

(assert (=> start!82720 (=> (not res!644160) (not e!543104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82720 (= res!644160 (validMask!0 mask!2110))))

(assert (=> start!82720 e!543104))

(assert (=> start!82720 true))

(declare-fun array_inv!22085 (array!59092) Bool)

(assert (=> start!82720 (and (array_inv!22085 _values!1400) e!543105)))

(declare-fun array_inv!22086 (array!59094) Bool)

(assert (=> start!82720 (array_inv!22086 _keys!1686)))

(assert (=> start!82720 tp!65175))

(assert (=> start!82720 tp_is_empty!21487))

(declare-fun mapNonEmpty!34225 () Bool)

(declare-fun tp!65176 () Bool)

(assert (=> mapNonEmpty!34225 (= mapRes!34225 (and tp!65176 e!543107))))

(declare-fun mapValue!34225 () ValueCell!10262)

(declare-fun mapKey!34225 () (_ BitVec 32))

(declare-fun mapRest!34225 () (Array (_ BitVec 32) ValueCell!10262))

(assert (=> mapNonEmpty!34225 (= (arr!28410 _values!1400) (store mapRest!34225 mapKey!34225 mapValue!34225))))

(assert (= (and start!82720 res!644160) b!962942))

(assert (= (and b!962942 res!644159) b!962941))

(assert (= (and b!962941 res!644161) b!962940))

(assert (= (and b!962940 res!644158) b!962943))

(assert (= (and b!962943 res!644163) b!962939))

(assert (= (and b!962939 res!644162) b!962937))

(assert (= (and b!962936 condMapEmpty!34225) mapIsEmpty!34225))

(assert (= (and b!962936 (not condMapEmpty!34225)) mapNonEmpty!34225))

(get-info :version)

(assert (= (and mapNonEmpty!34225 ((_ is ValueCellFull!10262) mapValue!34225)) b!962938))

(assert (= (and b!962936 ((_ is ValueCellFull!10262) mapDefault!34225)) b!962944))

(assert (= start!82720 b!962936))

(declare-fun m!893083 () Bool)

(assert (=> b!962937 m!893083))

(declare-fun m!893085 () Bool)

(assert (=> b!962937 m!893085))

(assert (=> b!962937 m!893083))

(assert (=> b!962937 m!893085))

(declare-fun m!893087 () Bool)

(assert (=> b!962937 m!893087))

(declare-fun m!893089 () Bool)

(assert (=> b!962940 m!893089))

(assert (=> b!962939 m!893085))

(assert (=> b!962939 m!893085))

(declare-fun m!893091 () Bool)

(assert (=> b!962939 m!893091))

(declare-fun m!893093 () Bool)

(assert (=> start!82720 m!893093))

(declare-fun m!893095 () Bool)

(assert (=> start!82720 m!893095))

(declare-fun m!893097 () Bool)

(assert (=> start!82720 m!893097))

(declare-fun m!893099 () Bool)

(assert (=> mapNonEmpty!34225 m!893099))

(declare-fun m!893101 () Bool)

(assert (=> b!962941 m!893101))

(check-sat (not b!962940) b_and!30183 (not start!82720) (not b!962937) (not b!962939) tp_is_empty!21487 (not b_next!18685) (not mapNonEmpty!34225) (not b!962941))
(check-sat b_and!30183 (not b_next!18685))
