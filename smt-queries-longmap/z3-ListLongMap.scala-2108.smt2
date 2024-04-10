; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35818 () Bool)

(assert start!35818)

(declare-fun mapIsEmpty!13914 () Bool)

(declare-fun mapRes!13914 () Bool)

(assert (=> mapIsEmpty!13914 mapRes!13914))

(declare-fun b!359820 () Bool)

(declare-fun res!200007 () Bool)

(declare-fun e!220408 () Bool)

(assert (=> b!359820 (=> (not res!200007) (not e!220408))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-datatypes ((array!20095 0))(
  ( (array!20096 (arr!9541 (Array (_ BitVec 32) (_ BitVec 64))) (size!9893 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20095)

(declare-fun arrayContainsKey!0 (array!20095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359820 (= res!200007 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun res!200005 () Bool)

(assert (=> start!35818 (=> (not res!200005) (not e!220408))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35818 (= res!200005 (validMask!0 mask!1842))))

(assert (=> start!35818 e!220408))

(declare-fun tp_is_empty!8271 () Bool)

(assert (=> start!35818 tp_is_empty!8271))

(assert (=> start!35818 true))

(declare-fun array_inv!7018 (array!20095) Bool)

(assert (=> start!35818 (array_inv!7018 _keys!1456)))

(declare-datatypes ((V!12005 0))(
  ( (V!12006 (val!4180 Int)) )
))
(declare-datatypes ((ValueCell!3792 0))(
  ( (ValueCellFull!3792 (v!6374 V!12005)) (EmptyCell!3792) )
))
(declare-datatypes ((array!20097 0))(
  ( (array!20098 (arr!9542 (Array (_ BitVec 32) ValueCell!3792)) (size!9894 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20097)

(declare-fun e!220410 () Bool)

(declare-fun array_inv!7019 (array!20097) Bool)

(assert (=> start!35818 (and (array_inv!7019 _values!1208) e!220410)))

(declare-fun b!359821 () Bool)

(declare-fun res!200006 () Bool)

(assert (=> b!359821 (=> (not res!200006) (not e!220408))))

(assert (=> b!359821 (= res!200006 (not (= (select (arr!9541 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359822 () Bool)

(declare-fun e!220409 () Bool)

(assert (=> b!359822 (= e!220410 (and e!220409 mapRes!13914))))

(declare-fun condMapEmpty!13914 () Bool)

(declare-fun mapDefault!13914 () ValueCell!3792)

(assert (=> b!359822 (= condMapEmpty!13914 (= (arr!9542 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3792)) mapDefault!13914)))))

(declare-fun b!359823 () Bool)

(declare-fun res!200009 () Bool)

(assert (=> b!359823 (=> (not res!200009) (not e!220408))))

(declare-datatypes ((List!5480 0))(
  ( (Nil!5477) (Cons!5476 (h!6332 (_ BitVec 64)) (t!10630 List!5480)) )
))
(declare-fun arrayNoDuplicates!0 (array!20095 (_ BitVec 32) List!5480) Bool)

(assert (=> b!359823 (= res!200009 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5477))))

(declare-fun b!359824 () Bool)

(assert (=> b!359824 (= e!220408 (not true))))

(assert (=> b!359824 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12005)

(declare-datatypes ((Unit!11062 0))(
  ( (Unit!11063) )
))
(declare-fun lt!166394 () Unit!11062)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12005)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!46 (array!20095 array!20097 (_ BitVec 32) (_ BitVec 32) V!12005 V!12005 (_ BitVec 64) (_ BitVec 32)) Unit!11062)

(assert (=> b!359824 (= lt!166394 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!46 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!359825 () Bool)

(declare-fun res!200010 () Bool)

(assert (=> b!359825 (=> (not res!200010) (not e!220408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359825 (= res!200010 (validKeyInArray!0 k0!1077))))

(declare-fun b!359826 () Bool)

(declare-fun res!200008 () Bool)

(assert (=> b!359826 (=> (not res!200008) (not e!220408))))

(assert (=> b!359826 (= res!200008 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9893 _keys!1456))))))

(declare-fun b!359827 () Bool)

(declare-fun res!200004 () Bool)

(assert (=> b!359827 (=> (not res!200004) (not e!220408))))

(assert (=> b!359827 (= res!200004 (and (= (size!9894 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9893 _keys!1456) (size!9894 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13914 () Bool)

(declare-fun tp!27981 () Bool)

(declare-fun e!220411 () Bool)

(assert (=> mapNonEmpty!13914 (= mapRes!13914 (and tp!27981 e!220411))))

(declare-fun mapKey!13914 () (_ BitVec 32))

(declare-fun mapValue!13914 () ValueCell!3792)

(declare-fun mapRest!13914 () (Array (_ BitVec 32) ValueCell!3792))

(assert (=> mapNonEmpty!13914 (= (arr!9542 _values!1208) (store mapRest!13914 mapKey!13914 mapValue!13914))))

(declare-fun b!359828 () Bool)

(assert (=> b!359828 (= e!220411 tp_is_empty!8271)))

(declare-fun b!359829 () Bool)

(declare-fun res!200011 () Bool)

(assert (=> b!359829 (=> (not res!200011) (not e!220408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20095 (_ BitVec 32)) Bool)

(assert (=> b!359829 (= res!200011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359830 () Bool)

(assert (=> b!359830 (= e!220409 tp_is_empty!8271)))

(assert (= (and start!35818 res!200005) b!359827))

(assert (= (and b!359827 res!200004) b!359829))

(assert (= (and b!359829 res!200011) b!359823))

(assert (= (and b!359823 res!200009) b!359825))

(assert (= (and b!359825 res!200010) b!359826))

(assert (= (and b!359826 res!200008) b!359820))

(assert (= (and b!359820 res!200007) b!359821))

(assert (= (and b!359821 res!200006) b!359824))

(assert (= (and b!359822 condMapEmpty!13914) mapIsEmpty!13914))

(assert (= (and b!359822 (not condMapEmpty!13914)) mapNonEmpty!13914))

(get-info :version)

(assert (= (and mapNonEmpty!13914 ((_ is ValueCellFull!3792) mapValue!13914)) b!359828))

(assert (= (and b!359822 ((_ is ValueCellFull!3792) mapDefault!13914)) b!359830))

(assert (= start!35818 b!359822))

(declare-fun m!357191 () Bool)

(assert (=> b!359820 m!357191))

(declare-fun m!357193 () Bool)

(assert (=> b!359821 m!357193))

(declare-fun m!357195 () Bool)

(assert (=> start!35818 m!357195))

(declare-fun m!357197 () Bool)

(assert (=> start!35818 m!357197))

(declare-fun m!357199 () Bool)

(assert (=> start!35818 m!357199))

(declare-fun m!357201 () Bool)

(assert (=> b!359823 m!357201))

(declare-fun m!357203 () Bool)

(assert (=> mapNonEmpty!13914 m!357203))

(declare-fun m!357205 () Bool)

(assert (=> b!359829 m!357205))

(declare-fun m!357207 () Bool)

(assert (=> b!359824 m!357207))

(declare-fun m!357209 () Bool)

(assert (=> b!359824 m!357209))

(declare-fun m!357211 () Bool)

(assert (=> b!359825 m!357211))

(check-sat (not b!359829) (not b!359825) (not b!359823) tp_is_empty!8271 (not start!35818) (not b!359820) (not mapNonEmpty!13914) (not b!359824))
(check-sat)
