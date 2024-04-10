; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82342 () Bool)

(assert start!82342)

(declare-fun b_free!18609 () Bool)

(declare-fun b_next!18609 () Bool)

(assert (=> start!82342 (= b_free!18609 (not b_next!18609))))

(declare-fun tp!64797 () Bool)

(declare-fun b_and!30097 () Bool)

(assert (=> start!82342 (= tp!64797 b_and!30097)))

(declare-fun res!642637 () Bool)

(declare-fun e!541181 () Bool)

(assert (=> start!82342 (=> (not res!642637) (not e!541181))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82342 (= res!642637 (validMask!0 mask!2088))))

(assert (=> start!82342 e!541181))

(assert (=> start!82342 true))

(declare-fun tp_is_empty!21321 () Bool)

(assert (=> start!82342 tp_is_empty!21321))

(declare-datatypes ((array!58733 0))(
  ( (array!58734 (arr!28240 (Array (_ BitVec 32) (_ BitVec 64))) (size!28719 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58733)

(declare-fun array_inv!21881 (array!58733) Bool)

(assert (=> start!82342 (array_inv!21881 _keys!1668)))

(declare-datatypes ((V!33411 0))(
  ( (V!33412 (val!10711 Int)) )
))
(declare-datatypes ((ValueCell!10179 0))(
  ( (ValueCellFull!10179 (v!13268 V!33411)) (EmptyCell!10179) )
))
(declare-datatypes ((array!58735 0))(
  ( (array!58736 (arr!28241 (Array (_ BitVec 32) ValueCell!10179)) (size!28720 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58735)

(declare-fun e!541183 () Bool)

(declare-fun array_inv!21882 (array!58735) Bool)

(assert (=> start!82342 (and (array_inv!21882 _values!1386) e!541183)))

(assert (=> start!82342 tp!64797))

(declare-fun b!960044 () Bool)

(declare-fun res!642638 () Bool)

(assert (=> b!960044 (=> (not res!642638) (not e!541181))))

(declare-datatypes ((List!19637 0))(
  ( (Nil!19634) (Cons!19633 (h!20795 (_ BitVec 64)) (t!28000 List!19637)) )
))
(declare-fun arrayNoDuplicates!0 (array!58733 (_ BitVec 32) List!19637) Bool)

(assert (=> b!960044 (= res!642638 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19634))))

(declare-fun b!960045 () Bool)

(declare-fun res!642641 () Bool)

(assert (=> b!960045 (=> (not res!642641) (not e!541181))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960045 (= res!642641 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28719 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28719 _keys!1668))))))

(declare-fun b!960046 () Bool)

(declare-fun res!642636 () Bool)

(assert (=> b!960046 (=> (not res!642636) (not e!541181))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!960046 (= res!642636 (and (= (size!28720 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28719 _keys!1668) (size!28720 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960047 () Bool)

(declare-fun res!642639 () Bool)

(assert (=> b!960047 (=> (not res!642639) (not e!541181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58733 (_ BitVec 32)) Bool)

(assert (=> b!960047 (= res!642639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960048 () Bool)

(declare-fun e!541185 () Bool)

(assert (=> b!960048 (= e!541185 tp_is_empty!21321)))

(declare-fun b!960049 () Bool)

(declare-fun mapRes!33961 () Bool)

(assert (=> b!960049 (= e!541183 (and e!541185 mapRes!33961))))

(declare-fun condMapEmpty!33961 () Bool)

(declare-fun mapDefault!33961 () ValueCell!10179)

(assert (=> b!960049 (= condMapEmpty!33961 (= (arr!28241 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10179)) mapDefault!33961)))))

(declare-fun b!960050 () Bool)

(assert (=> b!960050 (= e!541181 false)))

(declare-fun minValue!1328 () V!33411)

(declare-fun lt!430605 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33411)

(declare-datatypes ((tuple2!13818 0))(
  ( (tuple2!13819 (_1!6920 (_ BitVec 64)) (_2!6920 V!33411)) )
))
(declare-datatypes ((List!19638 0))(
  ( (Nil!19635) (Cons!19634 (h!20796 tuple2!13818) (t!28001 List!19638)) )
))
(declare-datatypes ((ListLongMap!12515 0))(
  ( (ListLongMap!12516 (toList!6273 List!19638)) )
))
(declare-fun contains!5372 (ListLongMap!12515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3506 (array!58733 array!58735 (_ BitVec 32) (_ BitVec 32) V!33411 V!33411 (_ BitVec 32) Int) ListLongMap!12515)

(assert (=> b!960050 (= lt!430605 (contains!5372 (getCurrentListMap!3506 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28240 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33961 () Bool)

(declare-fun tp!64796 () Bool)

(declare-fun e!541182 () Bool)

(assert (=> mapNonEmpty!33961 (= mapRes!33961 (and tp!64796 e!541182))))

(declare-fun mapRest!33961 () (Array (_ BitVec 32) ValueCell!10179))

(declare-fun mapValue!33961 () ValueCell!10179)

(declare-fun mapKey!33961 () (_ BitVec 32))

(assert (=> mapNonEmpty!33961 (= (arr!28241 _values!1386) (store mapRest!33961 mapKey!33961 mapValue!33961))))

(declare-fun b!960051 () Bool)

(assert (=> b!960051 (= e!541182 tp_is_empty!21321)))

(declare-fun mapIsEmpty!33961 () Bool)

(assert (=> mapIsEmpty!33961 mapRes!33961))

(declare-fun b!960052 () Bool)

(declare-fun res!642640 () Bool)

(assert (=> b!960052 (=> (not res!642640) (not e!541181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960052 (= res!642640 (validKeyInArray!0 (select (arr!28240 _keys!1668) i!793)))))

(assert (= (and start!82342 res!642637) b!960046))

(assert (= (and b!960046 res!642636) b!960047))

(assert (= (and b!960047 res!642639) b!960044))

(assert (= (and b!960044 res!642638) b!960045))

(assert (= (and b!960045 res!642641) b!960052))

(assert (= (and b!960052 res!642640) b!960050))

(assert (= (and b!960049 condMapEmpty!33961) mapIsEmpty!33961))

(assert (= (and b!960049 (not condMapEmpty!33961)) mapNonEmpty!33961))

(get-info :version)

(assert (= (and mapNonEmpty!33961 ((_ is ValueCellFull!10179) mapValue!33961)) b!960051))

(assert (= (and b!960049 ((_ is ValueCellFull!10179) mapDefault!33961)) b!960048))

(assert (= start!82342 b!960049))

(declare-fun m!890389 () Bool)

(assert (=> b!960047 m!890389))

(declare-fun m!890391 () Bool)

(assert (=> b!960052 m!890391))

(assert (=> b!960052 m!890391))

(declare-fun m!890393 () Bool)

(assert (=> b!960052 m!890393))

(declare-fun m!890395 () Bool)

(assert (=> mapNonEmpty!33961 m!890395))

(declare-fun m!890397 () Bool)

(assert (=> b!960050 m!890397))

(assert (=> b!960050 m!890391))

(assert (=> b!960050 m!890397))

(assert (=> b!960050 m!890391))

(declare-fun m!890399 () Bool)

(assert (=> b!960050 m!890399))

(declare-fun m!890401 () Bool)

(assert (=> start!82342 m!890401))

(declare-fun m!890403 () Bool)

(assert (=> start!82342 m!890403))

(declare-fun m!890405 () Bool)

(assert (=> start!82342 m!890405))

(declare-fun m!890407 () Bool)

(assert (=> b!960044 m!890407))

(check-sat (not b!960044) (not mapNonEmpty!33961) (not b!960047) (not b!960052) tp_is_empty!21321 (not b_next!18609) (not start!82342) (not b!960050) b_and!30097)
(check-sat b_and!30097 (not b_next!18609))
