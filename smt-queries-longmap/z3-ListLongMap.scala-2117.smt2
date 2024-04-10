; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35888 () Bool)

(assert start!35888)

(declare-fun b!360754 () Bool)

(declare-fun res!200681 () Bool)

(declare-fun e!220851 () Bool)

(assert (=> b!360754 (=> (not res!200681) (not e!220851))))

(declare-datatypes ((array!20203 0))(
  ( (array!20204 (arr!9594 (Array (_ BitVec 32) (_ BitVec 64))) (size!9946 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20203)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360754 (= res!200681 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun res!200675 () Bool)

(assert (=> start!35888 (=> (not res!200675) (not e!220851))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35888 (= res!200675 (validMask!0 mask!1842))))

(assert (=> start!35888 e!220851))

(declare-fun tp_is_empty!8325 () Bool)

(assert (=> start!35888 tp_is_empty!8325))

(assert (=> start!35888 true))

(declare-fun array_inv!7058 (array!20203) Bool)

(assert (=> start!35888 (array_inv!7058 _keys!1456)))

(declare-datatypes ((V!12077 0))(
  ( (V!12078 (val!4207 Int)) )
))
(declare-datatypes ((ValueCell!3819 0))(
  ( (ValueCellFull!3819 (v!6401 V!12077)) (EmptyCell!3819) )
))
(declare-datatypes ((array!20205 0))(
  ( (array!20206 (arr!9595 (Array (_ BitVec 32) ValueCell!3819)) (size!9947 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20205)

(declare-fun e!220850 () Bool)

(declare-fun array_inv!7059 (array!20205) Bool)

(assert (=> start!35888 (and (array_inv!7059 _values!1208) e!220850)))

(declare-fun b!360755 () Bool)

(declare-fun res!200682 () Bool)

(assert (=> b!360755 (=> (not res!200682) (not e!220851))))

(declare-datatypes ((List!5494 0))(
  ( (Nil!5491) (Cons!5490 (h!6346 (_ BitVec 64)) (t!10644 List!5494)) )
))
(declare-fun arrayNoDuplicates!0 (array!20203 (_ BitVec 32) List!5494) Bool)

(assert (=> b!360755 (= res!200682 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5491))))

(declare-fun b!360756 () Bool)

(declare-fun res!200680 () Bool)

(assert (=> b!360756 (=> (not res!200680) (not e!220851))))

(assert (=> b!360756 (= res!200680 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9946 _keys!1456))))))

(declare-fun b!360757 () Bool)

(declare-fun res!200676 () Bool)

(assert (=> b!360757 (=> (not res!200676) (not e!220851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20203 (_ BitVec 32)) Bool)

(assert (=> b!360757 (= res!200676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360758 () Bool)

(declare-fun e!220848 () Bool)

(declare-fun mapRes!13998 () Bool)

(assert (=> b!360758 (= e!220850 (and e!220848 mapRes!13998))))

(declare-fun condMapEmpty!13998 () Bool)

(declare-fun mapDefault!13998 () ValueCell!3819)

(assert (=> b!360758 (= condMapEmpty!13998 (= (arr!9595 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3819)) mapDefault!13998)))))

(declare-fun b!360759 () Bool)

(assert (=> b!360759 (= e!220848 tp_is_empty!8325)))

(declare-fun b!360760 () Bool)

(declare-fun res!200678 () Bool)

(assert (=> b!360760 (=> (not res!200678) (not e!220851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360760 (= res!200678 (validKeyInArray!0 k0!1077))))

(declare-fun b!360761 () Bool)

(assert (=> b!360761 (= e!220851 (not true))))

(assert (=> b!360761 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12077)

(declare-datatypes ((Unit!11096 0))(
  ( (Unit!11097) )
))
(declare-fun lt!166487 () Unit!11096)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12077)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!63 (array!20203 array!20205 (_ BitVec 32) (_ BitVec 32) V!12077 V!12077 (_ BitVec 64) (_ BitVec 32)) Unit!11096)

(assert (=> b!360761 (= lt!166487 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!63 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360762 () Bool)

(declare-fun res!200677 () Bool)

(assert (=> b!360762 (=> (not res!200677) (not e!220851))))

(assert (=> b!360762 (= res!200677 (not (= (select (arr!9594 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13998 () Bool)

(assert (=> mapIsEmpty!13998 mapRes!13998))

(declare-fun mapNonEmpty!13998 () Bool)

(declare-fun tp!28065 () Bool)

(declare-fun e!220852 () Bool)

(assert (=> mapNonEmpty!13998 (= mapRes!13998 (and tp!28065 e!220852))))

(declare-fun mapKey!13998 () (_ BitVec 32))

(declare-fun mapRest!13998 () (Array (_ BitVec 32) ValueCell!3819))

(declare-fun mapValue!13998 () ValueCell!3819)

(assert (=> mapNonEmpty!13998 (= (arr!9595 _values!1208) (store mapRest!13998 mapKey!13998 mapValue!13998))))

(declare-fun b!360763 () Bool)

(declare-fun res!200679 () Bool)

(assert (=> b!360763 (=> (not res!200679) (not e!220851))))

(assert (=> b!360763 (= res!200679 (and (= (size!9947 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9946 _keys!1456) (size!9947 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360764 () Bool)

(assert (=> b!360764 (= e!220852 tp_is_empty!8325)))

(assert (= (and start!35888 res!200675) b!360763))

(assert (= (and b!360763 res!200679) b!360757))

(assert (= (and b!360757 res!200676) b!360755))

(assert (= (and b!360755 res!200682) b!360760))

(assert (= (and b!360760 res!200678) b!360756))

(assert (= (and b!360756 res!200680) b!360754))

(assert (= (and b!360754 res!200681) b!360762))

(assert (= (and b!360762 res!200677) b!360761))

(assert (= (and b!360758 condMapEmpty!13998) mapIsEmpty!13998))

(assert (= (and b!360758 (not condMapEmpty!13998)) mapNonEmpty!13998))

(get-info :version)

(assert (= (and mapNonEmpty!13998 ((_ is ValueCellFull!3819) mapValue!13998)) b!360764))

(assert (= (and b!360758 ((_ is ValueCellFull!3819) mapDefault!13998)) b!360759))

(assert (= start!35888 b!360758))

(declare-fun m!357811 () Bool)

(assert (=> b!360754 m!357811))

(declare-fun m!357813 () Bool)

(assert (=> mapNonEmpty!13998 m!357813))

(declare-fun m!357815 () Bool)

(assert (=> b!360762 m!357815))

(declare-fun m!357817 () Bool)

(assert (=> b!360755 m!357817))

(declare-fun m!357819 () Bool)

(assert (=> b!360757 m!357819))

(declare-fun m!357821 () Bool)

(assert (=> b!360761 m!357821))

(declare-fun m!357823 () Bool)

(assert (=> b!360761 m!357823))

(declare-fun m!357825 () Bool)

(assert (=> start!35888 m!357825))

(declare-fun m!357827 () Bool)

(assert (=> start!35888 m!357827))

(declare-fun m!357829 () Bool)

(assert (=> start!35888 m!357829))

(declare-fun m!357831 () Bool)

(assert (=> b!360760 m!357831))

(check-sat (not b!360754) (not b!360757) tp_is_empty!8325 (not b!360761) (not b!360755) (not mapNonEmpty!13998) (not start!35888) (not b!360760))
(check-sat)
