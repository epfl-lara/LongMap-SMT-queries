; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20828 () Bool)

(assert start!20828)

(declare-fun b_free!5481 () Bool)

(declare-fun b_next!5481 () Bool)

(assert (=> start!20828 (= b_free!5481 (not b_next!5481))))

(declare-fun tp!19484 () Bool)

(declare-fun b_and!12227 () Bool)

(assert (=> start!20828 (= tp!19484 b_and!12227)))

(declare-fun res!101705 () Bool)

(declare-fun e!136168 () Bool)

(assert (=> start!20828 (=> (not res!101705) (not e!136168))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20828 (= res!101705 (validMask!0 mask!1149))))

(assert (=> start!20828 e!136168))

(declare-datatypes ((V!6771 0))(
  ( (V!6772 (val!2716 Int)) )
))
(declare-datatypes ((ValueCell!2328 0))(
  ( (ValueCellFull!2328 (v!4686 V!6771)) (EmptyCell!2328) )
))
(declare-datatypes ((array!9889 0))(
  ( (array!9890 (arr!4695 (Array (_ BitVec 32) ValueCell!2328)) (size!5020 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9889)

(declare-fun e!136167 () Bool)

(declare-fun array_inv!3113 (array!9889) Bool)

(assert (=> start!20828 (and (array_inv!3113 _values!649) e!136167)))

(assert (=> start!20828 true))

(declare-fun tp_is_empty!5343 () Bool)

(assert (=> start!20828 tp_is_empty!5343))

(declare-datatypes ((array!9891 0))(
  ( (array!9892 (arr!4696 (Array (_ BitVec 32) (_ BitVec 64))) (size!5021 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9891)

(declare-fun array_inv!3114 (array!9891) Bool)

(assert (=> start!20828 (array_inv!3114 _keys!825)))

(assert (=> start!20828 tp!19484))

(declare-fun mapNonEmpty!9083 () Bool)

(declare-fun mapRes!9083 () Bool)

(declare-fun tp!19483 () Bool)

(declare-fun e!136165 () Bool)

(assert (=> mapNonEmpty!9083 (= mapRes!9083 (and tp!19483 e!136165))))

(declare-fun mapValue!9083 () ValueCell!2328)

(declare-fun mapKey!9083 () (_ BitVec 32))

(declare-fun mapRest!9083 () (Array (_ BitVec 32) ValueCell!2328))

(assert (=> mapNonEmpty!9083 (= (arr!4695 _values!649) (store mapRest!9083 mapKey!9083 mapValue!9083))))

(declare-fun b!208880 () Bool)

(declare-fun res!101708 () Bool)

(assert (=> b!208880 (=> (not res!101708) (not e!136168))))

(declare-datatypes ((List!3008 0))(
  ( (Nil!3005) (Cons!3004 (h!3646 (_ BitVec 64)) (t!7939 List!3008)) )
))
(declare-fun arrayNoDuplicates!0 (array!9891 (_ BitVec 32) List!3008) Bool)

(assert (=> b!208880 (= res!101708 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3005))))

(declare-fun b!208881 () Bool)

(declare-fun res!101709 () Bool)

(assert (=> b!208881 (=> (not res!101709) (not e!136168))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208881 (= res!101709 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5021 _keys!825))))))

(declare-fun b!208882 () Bool)

(assert (=> b!208882 (= e!136168 false)))

(declare-fun v!520 () V!6771)

(declare-fun zeroValue!615 () V!6771)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6771)

(declare-datatypes ((tuple2!4112 0))(
  ( (tuple2!4113 (_1!2067 (_ BitVec 64)) (_2!2067 V!6771)) )
))
(declare-datatypes ((List!3009 0))(
  ( (Nil!3006) (Cons!3005 (h!3647 tuple2!4112) (t!7940 List!3009)) )
))
(declare-datatypes ((ListLongMap!3025 0))(
  ( (ListLongMap!3026 (toList!1528 List!3009)) )
))
(declare-fun lt!106875 () ListLongMap!3025)

(declare-fun getCurrentListMapNoExtraKeys!469 (array!9891 array!9889 (_ BitVec 32) (_ BitVec 32) V!6771 V!6771 (_ BitVec 32) Int) ListLongMap!3025)

(assert (=> b!208882 (= lt!106875 (getCurrentListMapNoExtraKeys!469 _keys!825 (array!9890 (store (arr!4695 _values!649) i!601 (ValueCellFull!2328 v!520)) (size!5020 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106874 () ListLongMap!3025)

(assert (=> b!208882 (= lt!106874 (getCurrentListMapNoExtraKeys!469 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208883 () Bool)

(declare-fun res!101704 () Bool)

(assert (=> b!208883 (=> (not res!101704) (not e!136168))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!208883 (= res!101704 (= (select (arr!4696 _keys!825) i!601) k0!843))))

(declare-fun b!208884 () Bool)

(declare-fun res!101710 () Bool)

(assert (=> b!208884 (=> (not res!101710) (not e!136168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9891 (_ BitVec 32)) Bool)

(assert (=> b!208884 (= res!101710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208885 () Bool)

(declare-fun res!101706 () Bool)

(assert (=> b!208885 (=> (not res!101706) (not e!136168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208885 (= res!101706 (validKeyInArray!0 k0!843))))

(declare-fun b!208886 () Bool)

(declare-fun res!101707 () Bool)

(assert (=> b!208886 (=> (not res!101707) (not e!136168))))

(assert (=> b!208886 (= res!101707 (and (= (size!5020 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5021 _keys!825) (size!5020 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208887 () Bool)

(declare-fun e!136169 () Bool)

(assert (=> b!208887 (= e!136167 (and e!136169 mapRes!9083))))

(declare-fun condMapEmpty!9083 () Bool)

(declare-fun mapDefault!9083 () ValueCell!2328)

(assert (=> b!208887 (= condMapEmpty!9083 (= (arr!4695 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2328)) mapDefault!9083)))))

(declare-fun b!208888 () Bool)

(assert (=> b!208888 (= e!136165 tp_is_empty!5343)))

(declare-fun mapIsEmpty!9083 () Bool)

(assert (=> mapIsEmpty!9083 mapRes!9083))

(declare-fun b!208889 () Bool)

(assert (=> b!208889 (= e!136169 tp_is_empty!5343)))

(assert (= (and start!20828 res!101705) b!208886))

(assert (= (and b!208886 res!101707) b!208884))

(assert (= (and b!208884 res!101710) b!208880))

(assert (= (and b!208880 res!101708) b!208881))

(assert (= (and b!208881 res!101709) b!208885))

(assert (= (and b!208885 res!101706) b!208883))

(assert (= (and b!208883 res!101704) b!208882))

(assert (= (and b!208887 condMapEmpty!9083) mapIsEmpty!9083))

(assert (= (and b!208887 (not condMapEmpty!9083)) mapNonEmpty!9083))

(get-info :version)

(assert (= (and mapNonEmpty!9083 ((_ is ValueCellFull!2328) mapValue!9083)) b!208888))

(assert (= (and b!208887 ((_ is ValueCellFull!2328) mapDefault!9083)) b!208889))

(assert (= start!20828 b!208887))

(declare-fun m!236393 () Bool)

(assert (=> start!20828 m!236393))

(declare-fun m!236395 () Bool)

(assert (=> start!20828 m!236395))

(declare-fun m!236397 () Bool)

(assert (=> start!20828 m!236397))

(declare-fun m!236399 () Bool)

(assert (=> b!208882 m!236399))

(declare-fun m!236401 () Bool)

(assert (=> b!208882 m!236401))

(declare-fun m!236403 () Bool)

(assert (=> b!208882 m!236403))

(declare-fun m!236405 () Bool)

(assert (=> b!208885 m!236405))

(declare-fun m!236407 () Bool)

(assert (=> b!208884 m!236407))

(declare-fun m!236409 () Bool)

(assert (=> mapNonEmpty!9083 m!236409))

(declare-fun m!236411 () Bool)

(assert (=> b!208883 m!236411))

(declare-fun m!236413 () Bool)

(assert (=> b!208880 m!236413))

(check-sat (not start!20828) (not b!208882) (not b!208880) (not b!208885) tp_is_empty!5343 b_and!12227 (not b!208884) (not mapNonEmpty!9083) (not b_next!5481))
(check-sat b_and!12227 (not b_next!5481))
