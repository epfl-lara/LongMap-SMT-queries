; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35860 () Bool)

(assert start!35860)

(declare-fun b!360513 () Bool)

(declare-fun e!220724 () Bool)

(declare-fun tp_is_empty!8313 () Bool)

(assert (=> b!360513 (= e!220724 tp_is_empty!8313)))

(declare-fun b!360514 () Bool)

(declare-fun res!200512 () Bool)

(declare-fun e!220723 () Bool)

(assert (=> b!360514 (=> (not res!200512) (not e!220723))))

(declare-datatypes ((array!20177 0))(
  ( (array!20178 (arr!9582 (Array (_ BitVec 32) (_ BitVec 64))) (size!9934 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20177)

(declare-datatypes ((List!5490 0))(
  ( (Nil!5487) (Cons!5486 (h!6342 (_ BitVec 64)) (t!10640 List!5490)) )
))
(declare-fun arrayNoDuplicates!0 (array!20177 (_ BitVec 32) List!5490) Bool)

(assert (=> b!360514 (= res!200512 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5487))))

(declare-fun b!360515 () Bool)

(declare-fun res!200509 () Bool)

(assert (=> b!360515 (=> (not res!200509) (not e!220723))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!360515 (= res!200509 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9934 _keys!1456))))))

(declare-fun b!360516 () Bool)

(declare-fun e!220725 () Bool)

(assert (=> b!360516 (= e!220725 tp_is_empty!8313)))

(declare-fun b!360517 () Bool)

(declare-fun e!220726 () Bool)

(declare-fun mapRes!13977 () Bool)

(assert (=> b!360517 (= e!220726 (and e!220725 mapRes!13977))))

(declare-fun condMapEmpty!13977 () Bool)

(declare-datatypes ((V!12061 0))(
  ( (V!12062 (val!4201 Int)) )
))
(declare-datatypes ((ValueCell!3813 0))(
  ( (ValueCellFull!3813 (v!6395 V!12061)) (EmptyCell!3813) )
))
(declare-datatypes ((array!20179 0))(
  ( (array!20180 (arr!9583 (Array (_ BitVec 32) ValueCell!3813)) (size!9935 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20179)

(declare-fun mapDefault!13977 () ValueCell!3813)

(assert (=> b!360517 (= condMapEmpty!13977 (= (arr!9583 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3813)) mapDefault!13977)))))

(declare-fun b!360518 () Bool)

(assert (=> b!360518 (= e!220723 (not true))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360518 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12061)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12061)

(declare-datatypes ((Unit!11090 0))(
  ( (Unit!11091) )
))
(declare-fun lt!166457 () Unit!11090)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!60 (array!20177 array!20179 (_ BitVec 32) (_ BitVec 32) V!12061 V!12061 (_ BitVec 64) (_ BitVec 32)) Unit!11090)

(assert (=> b!360518 (= lt!166457 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!60 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun res!200510 () Bool)

(assert (=> start!35860 (=> (not res!200510) (not e!220723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35860 (= res!200510 (validMask!0 mask!1842))))

(assert (=> start!35860 e!220723))

(assert (=> start!35860 tp_is_empty!8313))

(assert (=> start!35860 true))

(declare-fun array_inv!7050 (array!20177) Bool)

(assert (=> start!35860 (array_inv!7050 _keys!1456)))

(declare-fun array_inv!7051 (array!20179) Bool)

(assert (=> start!35860 (and (array_inv!7051 _values!1208) e!220726)))

(declare-fun b!360519 () Bool)

(declare-fun res!200514 () Bool)

(assert (=> b!360519 (=> (not res!200514) (not e!220723))))

(assert (=> b!360519 (= res!200514 (and (= (size!9935 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9934 _keys!1456) (size!9935 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360520 () Bool)

(declare-fun res!200515 () Bool)

(assert (=> b!360520 (=> (not res!200515) (not e!220723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20177 (_ BitVec 32)) Bool)

(assert (=> b!360520 (= res!200515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360521 () Bool)

(declare-fun res!200511 () Bool)

(assert (=> b!360521 (=> (not res!200511) (not e!220723))))

(assert (=> b!360521 (= res!200511 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13977 () Bool)

(declare-fun tp!28044 () Bool)

(assert (=> mapNonEmpty!13977 (= mapRes!13977 (and tp!28044 e!220724))))

(declare-fun mapValue!13977 () ValueCell!3813)

(declare-fun mapRest!13977 () (Array (_ BitVec 32) ValueCell!3813))

(declare-fun mapKey!13977 () (_ BitVec 32))

(assert (=> mapNonEmpty!13977 (= (arr!9583 _values!1208) (store mapRest!13977 mapKey!13977 mapValue!13977))))

(declare-fun b!360522 () Bool)

(declare-fun res!200508 () Bool)

(assert (=> b!360522 (=> (not res!200508) (not e!220723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360522 (= res!200508 (validKeyInArray!0 k0!1077))))

(declare-fun b!360523 () Bool)

(declare-fun res!200513 () Bool)

(assert (=> b!360523 (=> (not res!200513) (not e!220723))))

(assert (=> b!360523 (= res!200513 (not (= (select (arr!9582 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13977 () Bool)

(assert (=> mapIsEmpty!13977 mapRes!13977))

(assert (= (and start!35860 res!200510) b!360519))

(assert (= (and b!360519 res!200514) b!360520))

(assert (= (and b!360520 res!200515) b!360514))

(assert (= (and b!360514 res!200512) b!360522))

(assert (= (and b!360522 res!200508) b!360515))

(assert (= (and b!360515 res!200509) b!360521))

(assert (= (and b!360521 res!200511) b!360523))

(assert (= (and b!360523 res!200513) b!360518))

(assert (= (and b!360517 condMapEmpty!13977) mapIsEmpty!13977))

(assert (= (and b!360517 (not condMapEmpty!13977)) mapNonEmpty!13977))

(get-info :version)

(assert (= (and mapNonEmpty!13977 ((_ is ValueCellFull!3813) mapValue!13977)) b!360513))

(assert (= (and b!360517 ((_ is ValueCellFull!3813) mapDefault!13977)) b!360516))

(assert (= start!35860 b!360517))

(declare-fun m!357653 () Bool)

(assert (=> b!360523 m!357653))

(declare-fun m!357655 () Bool)

(assert (=> b!360520 m!357655))

(declare-fun m!357657 () Bool)

(assert (=> b!360514 m!357657))

(declare-fun m!357659 () Bool)

(assert (=> b!360518 m!357659))

(declare-fun m!357661 () Bool)

(assert (=> b!360518 m!357661))

(declare-fun m!357663 () Bool)

(assert (=> b!360521 m!357663))

(declare-fun m!357665 () Bool)

(assert (=> start!35860 m!357665))

(declare-fun m!357667 () Bool)

(assert (=> start!35860 m!357667))

(declare-fun m!357669 () Bool)

(assert (=> start!35860 m!357669))

(declare-fun m!357671 () Bool)

(assert (=> b!360522 m!357671))

(declare-fun m!357673 () Bool)

(assert (=> mapNonEmpty!13977 m!357673))

(check-sat (not b!360518) (not b!360520) (not start!35860) tp_is_empty!8313 (not mapNonEmpty!13977) (not b!360514) (not b!360522) (not b!360521))
(check-sat)
