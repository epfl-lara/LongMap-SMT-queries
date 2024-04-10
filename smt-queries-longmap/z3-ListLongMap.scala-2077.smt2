; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35632 () Bool)

(assert start!35632)

(declare-fun b_free!7887 () Bool)

(declare-fun b_next!7887 () Bool)

(assert (=> start!35632 (= b_free!7887 (not b_next!7887))))

(declare-fun tp!27644 () Bool)

(declare-fun b_and!15129 () Bool)

(assert (=> start!35632 (= tp!27644 b_and!15129)))

(declare-fun b!357647 () Bool)

(declare-fun e!218969 () Bool)

(declare-fun tp_is_empty!8085 () Bool)

(assert (=> b!357647 (= e!218969 tp_is_empty!8085)))

(declare-fun mapIsEmpty!13635 () Bool)

(declare-fun mapRes!13635 () Bool)

(assert (=> mapIsEmpty!13635 mapRes!13635))

(declare-fun b!357648 () Bool)

(declare-fun res!198668 () Bool)

(declare-fun e!218967 () Bool)

(assert (=> b!357648 (=> (not res!198668) (not e!218967))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19737 0))(
  ( (array!19738 (arr!9362 (Array (_ BitVec 32) (_ BitVec 64))) (size!9714 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19737)

(declare-datatypes ((V!11757 0))(
  ( (V!11758 (val!4087 Int)) )
))
(declare-datatypes ((ValueCell!3699 0))(
  ( (ValueCellFull!3699 (v!6281 V!11757)) (EmptyCell!3699) )
))
(declare-datatypes ((array!19739 0))(
  ( (array!19740 (arr!9363 (Array (_ BitVec 32) ValueCell!3699)) (size!9715 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19739)

(assert (=> b!357648 (= res!198668 (and (= (size!9715 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9714 _keys!1456) (size!9715 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357649 () Bool)

(declare-fun e!218964 () Bool)

(assert (=> b!357649 (= e!218967 (not e!218964))))

(declare-fun res!198669 () Bool)

(assert (=> b!357649 (=> res!198669 e!218964)))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!357649 (= res!198669 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9714 _keys!1456))))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357649 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11757)

(declare-datatypes ((Unit!11024 0))(
  ( (Unit!11025) )
))
(declare-fun lt!166075 () Unit!11024)

(declare-fun zeroValue!1150 () V!11757)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!31 (array!19737 array!19739 (_ BitVec 32) (_ BitVec 32) V!11757 V!11757 (_ BitVec 64) (_ BitVec 32)) Unit!11024)

(assert (=> b!357649 (= lt!166075 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!31 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357650 () Bool)

(declare-fun res!198676 () Bool)

(assert (=> b!357650 (=> (not res!198676) (not e!218967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19737 (_ BitVec 32)) Bool)

(assert (=> b!357650 (= res!198676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357651 () Bool)

(declare-fun res!198675 () Bool)

(assert (=> b!357651 (=> (not res!198675) (not e!218967))))

(assert (=> b!357651 (= res!198675 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9714 _keys!1456))))))

(declare-fun b!357652 () Bool)

(declare-fun res!198671 () Bool)

(assert (=> b!357652 (=> (not res!198671) (not e!218967))))

(assert (=> b!357652 (= res!198671 (not (= (select (arr!9362 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357653 () Bool)

(declare-fun res!198674 () Bool)

(assert (=> b!357653 (=> (not res!198674) (not e!218967))))

(assert (=> b!357653 (= res!198674 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357654 () Bool)

(declare-fun res!198670 () Bool)

(assert (=> b!357654 (=> (not res!198670) (not e!218967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357654 (= res!198670 (validKeyInArray!0 k0!1077))))

(declare-fun b!357655 () Bool)

(declare-fun e!218965 () Bool)

(assert (=> b!357655 (= e!218965 (and e!218969 mapRes!13635))))

(declare-fun condMapEmpty!13635 () Bool)

(declare-fun mapDefault!13635 () ValueCell!3699)

(assert (=> b!357655 (= condMapEmpty!13635 (= (arr!9363 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3699)) mapDefault!13635)))))

(declare-fun b!357656 () Bool)

(declare-fun res!198672 () Bool)

(assert (=> b!357656 (=> (not res!198672) (not e!218967))))

(declare-datatypes ((List!5404 0))(
  ( (Nil!5401) (Cons!5400 (h!6256 (_ BitVec 64)) (t!10554 List!5404)) )
))
(declare-fun arrayNoDuplicates!0 (array!19737 (_ BitVec 32) List!5404) Bool)

(assert (=> b!357656 (= res!198672 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5401))))

(declare-fun res!198673 () Bool)

(assert (=> start!35632 (=> (not res!198673) (not e!218967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35632 (= res!198673 (validMask!0 mask!1842))))

(assert (=> start!35632 e!218967))

(assert (=> start!35632 tp_is_empty!8085))

(assert (=> start!35632 true))

(assert (=> start!35632 tp!27644))

(declare-fun array_inv!6882 (array!19737) Bool)

(assert (=> start!35632 (array_inv!6882 _keys!1456)))

(declare-fun array_inv!6883 (array!19739) Bool)

(assert (=> start!35632 (and (array_inv!6883 _values!1208) e!218965)))

(declare-fun mapNonEmpty!13635 () Bool)

(declare-fun tp!27645 () Bool)

(declare-fun e!218968 () Bool)

(assert (=> mapNonEmpty!13635 (= mapRes!13635 (and tp!27645 e!218968))))

(declare-fun mapRest!13635 () (Array (_ BitVec 32) ValueCell!3699))

(declare-fun mapValue!13635 () ValueCell!3699)

(declare-fun mapKey!13635 () (_ BitVec 32))

(assert (=> mapNonEmpty!13635 (= (arr!9363 _values!1208) (store mapRest!13635 mapKey!13635 mapValue!13635))))

(declare-fun b!357657 () Bool)

(assert (=> b!357657 (= e!218964 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5712 0))(
  ( (tuple2!5713 (_1!2867 (_ BitVec 64)) (_2!2867 V!11757)) )
))
(declare-datatypes ((List!5405 0))(
  ( (Nil!5402) (Cons!5401 (h!6257 tuple2!5712) (t!10555 List!5405)) )
))
(declare-datatypes ((ListLongMap!4625 0))(
  ( (ListLongMap!4626 (toList!2328 List!5405)) )
))
(declare-fun contains!2408 (ListLongMap!4625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1849 (array!19737 array!19739 (_ BitVec 32) (_ BitVec 32) V!11757 V!11757 (_ BitVec 32) Int) ListLongMap!4625)

(assert (=> b!357657 (contains!2408 (getCurrentListMap!1849 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166076 () Unit!11024)

(declare-fun lemmaArrayContainsKeyThenInListMap!344 (array!19737 array!19739 (_ BitVec 32) (_ BitVec 32) V!11757 V!11757 (_ BitVec 64) (_ BitVec 32) Int) Unit!11024)

(assert (=> b!357657 (= lt!166076 (lemmaArrayContainsKeyThenInListMap!344 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357658 () Bool)

(assert (=> b!357658 (= e!218968 tp_is_empty!8085)))

(assert (= (and start!35632 res!198673) b!357648))

(assert (= (and b!357648 res!198668) b!357650))

(assert (= (and b!357650 res!198676) b!357656))

(assert (= (and b!357656 res!198672) b!357654))

(assert (= (and b!357654 res!198670) b!357651))

(assert (= (and b!357651 res!198675) b!357653))

(assert (= (and b!357653 res!198674) b!357652))

(assert (= (and b!357652 res!198671) b!357649))

(assert (= (and b!357649 (not res!198669)) b!357657))

(assert (= (and b!357655 condMapEmpty!13635) mapIsEmpty!13635))

(assert (= (and b!357655 (not condMapEmpty!13635)) mapNonEmpty!13635))

(get-info :version)

(assert (= (and mapNonEmpty!13635 ((_ is ValueCellFull!3699) mapValue!13635)) b!357658))

(assert (= (and b!357655 ((_ is ValueCellFull!3699) mapDefault!13635)) b!357647))

(assert (= start!35632 b!357655))

(declare-fun m!355679 () Bool)

(assert (=> b!357650 m!355679))

(declare-fun m!355681 () Bool)

(assert (=> b!357657 m!355681))

(assert (=> b!357657 m!355681))

(declare-fun m!355683 () Bool)

(assert (=> b!357657 m!355683))

(declare-fun m!355685 () Bool)

(assert (=> b!357657 m!355685))

(declare-fun m!355687 () Bool)

(assert (=> b!357656 m!355687))

(declare-fun m!355689 () Bool)

(assert (=> b!357654 m!355689))

(declare-fun m!355691 () Bool)

(assert (=> b!357649 m!355691))

(declare-fun m!355693 () Bool)

(assert (=> b!357649 m!355693))

(declare-fun m!355695 () Bool)

(assert (=> b!357652 m!355695))

(declare-fun m!355697 () Bool)

(assert (=> b!357653 m!355697))

(declare-fun m!355699 () Bool)

(assert (=> start!35632 m!355699))

(declare-fun m!355701 () Bool)

(assert (=> start!35632 m!355701))

(declare-fun m!355703 () Bool)

(assert (=> start!35632 m!355703))

(declare-fun m!355705 () Bool)

(assert (=> mapNonEmpty!13635 m!355705))

(check-sat b_and!15129 (not b!357654) tp_is_empty!8085 (not mapNonEmpty!13635) (not b!357650) (not start!35632) (not b!357657) (not b!357649) (not b!357656) (not b_next!7887) (not b!357653))
(check-sat b_and!15129 (not b_next!7887))
