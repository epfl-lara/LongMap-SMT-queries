; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40864 () Bool)

(assert start!40864)

(declare-fun b_free!10813 () Bool)

(declare-fun b_next!10813 () Bool)

(assert (=> start!40864 (= b_free!10813 (not b_next!10813))))

(declare-fun tp!38265 () Bool)

(declare-fun b_and!18929 () Bool)

(assert (=> start!40864 (= tp!38265 b_and!18929)))

(declare-fun b!453646 () Bool)

(declare-fun e!265500 () Bool)

(assert (=> b!453646 (= e!265500 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17307 0))(
  ( (V!17308 (val!6120 Int)) )
))
(declare-datatypes ((ValueCell!5732 0))(
  ( (ValueCellFull!5732 (v!8380 V!17307)) (EmptyCell!5732) )
))
(declare-datatypes ((array!28099 0))(
  ( (array!28100 (arr!13493 (Array (_ BitVec 32) ValueCell!5732)) (size!13846 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28099)

(declare-fun zeroValue!515 () V!17307)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17307)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17307)

(declare-datatypes ((tuple2!8070 0))(
  ( (tuple2!8071 (_1!4046 (_ BitVec 64)) (_2!4046 V!17307)) )
))
(declare-datatypes ((List!8128 0))(
  ( (Nil!8125) (Cons!8124 (h!8980 tuple2!8070) (t!13947 List!8128)) )
))
(declare-datatypes ((ListLongMap!6973 0))(
  ( (ListLongMap!6974 (toList!3502 List!8128)) )
))
(declare-fun lt!205798 () ListLongMap!6973)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((array!28101 0))(
  ( (array!28102 (arr!13494 (Array (_ BitVec 32) (_ BitVec 64))) (size!13847 (_ BitVec 32))) )
))
(declare-fun lt!205799 () array!28101)

(declare-fun getCurrentListMapNoExtraKeys!1697 (array!28101 array!28099 (_ BitVec 32) (_ BitVec 32) V!17307 V!17307 (_ BitVec 32) Int) ListLongMap!6973)

(assert (=> b!453646 (= lt!205798 (getCurrentListMapNoExtraKeys!1697 lt!205799 (array!28100 (store (arr!13493 _values!549) i!563 (ValueCellFull!5732 v!412)) (size!13846 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!28101)

(declare-fun lt!205797 () ListLongMap!6973)

(assert (=> b!453646 (= lt!205797 (getCurrentListMapNoExtraKeys!1697 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!270226 () Bool)

(declare-fun e!265498 () Bool)

(assert (=> start!40864 (=> (not res!270226) (not e!265498))))

(assert (=> start!40864 (= res!270226 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13847 _keys!709))))))

(assert (=> start!40864 e!265498))

(declare-fun tp_is_empty!12151 () Bool)

(assert (=> start!40864 tp_is_empty!12151))

(assert (=> start!40864 tp!38265))

(assert (=> start!40864 true))

(declare-fun e!265501 () Bool)

(declare-fun array_inv!9834 (array!28099) Bool)

(assert (=> start!40864 (and (array_inv!9834 _values!549) e!265501)))

(declare-fun array_inv!9835 (array!28101) Bool)

(assert (=> start!40864 (array_inv!9835 _keys!709)))

(declare-fun b!453647 () Bool)

(declare-fun res!270227 () Bool)

(assert (=> b!453647 (=> (not res!270227) (not e!265498))))

(assert (=> b!453647 (= res!270227 (and (= (size!13846 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13847 _keys!709) (size!13846 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!453648 () Bool)

(declare-fun res!270225 () Bool)

(assert (=> b!453648 (=> (not res!270225) (not e!265500))))

(assert (=> b!453648 (= res!270225 (bvsle from!863 i!563))))

(declare-fun b!453649 () Bool)

(declare-fun res!270223 () Bool)

(assert (=> b!453649 (=> (not res!270223) (not e!265498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453649 (= res!270223 (validMask!0 mask!1025))))

(declare-fun b!453650 () Bool)

(declare-fun e!265496 () Bool)

(assert (=> b!453650 (= e!265496 tp_is_empty!12151)))

(declare-fun mapIsEmpty!19867 () Bool)

(declare-fun mapRes!19867 () Bool)

(assert (=> mapIsEmpty!19867 mapRes!19867))

(declare-fun b!453651 () Bool)

(declare-fun res!270230 () Bool)

(assert (=> b!453651 (=> (not res!270230) (not e!265498))))

(declare-datatypes ((List!8129 0))(
  ( (Nil!8126) (Cons!8125 (h!8981 (_ BitVec 64)) (t!13948 List!8129)) )
))
(declare-fun arrayNoDuplicates!0 (array!28101 (_ BitVec 32) List!8129) Bool)

(assert (=> b!453651 (= res!270230 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8126))))

(declare-fun b!453652 () Bool)

(declare-fun res!270224 () Bool)

(assert (=> b!453652 (=> (not res!270224) (not e!265498))))

(assert (=> b!453652 (= res!270224 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13847 _keys!709))))))

(declare-fun b!453653 () Bool)

(declare-fun res!270220 () Bool)

(assert (=> b!453653 (=> (not res!270220) (not e!265498))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453653 (= res!270220 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19867 () Bool)

(declare-fun tp!38266 () Bool)

(declare-fun e!265497 () Bool)

(assert (=> mapNonEmpty!19867 (= mapRes!19867 (and tp!38266 e!265497))))

(declare-fun mapKey!19867 () (_ BitVec 32))

(declare-fun mapValue!19867 () ValueCell!5732)

(declare-fun mapRest!19867 () (Array (_ BitVec 32) ValueCell!5732))

(assert (=> mapNonEmpty!19867 (= (arr!13493 _values!549) (store mapRest!19867 mapKey!19867 mapValue!19867))))

(declare-fun b!453654 () Bool)

(declare-fun res!270229 () Bool)

(assert (=> b!453654 (=> (not res!270229) (not e!265500))))

(assert (=> b!453654 (= res!270229 (arrayNoDuplicates!0 lt!205799 #b00000000000000000000000000000000 Nil!8126))))

(declare-fun b!453655 () Bool)

(declare-fun res!270219 () Bool)

(assert (=> b!453655 (=> (not res!270219) (not e!265498))))

(assert (=> b!453655 (= res!270219 (or (= (select (arr!13494 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13494 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453656 () Bool)

(assert (=> b!453656 (= e!265498 e!265500)))

(declare-fun res!270221 () Bool)

(assert (=> b!453656 (=> (not res!270221) (not e!265500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28101 (_ BitVec 32)) Bool)

(assert (=> b!453656 (= res!270221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205799 mask!1025))))

(assert (=> b!453656 (= lt!205799 (array!28102 (store (arr!13494 _keys!709) i!563 k0!794) (size!13847 _keys!709)))))

(declare-fun b!453657 () Bool)

(assert (=> b!453657 (= e!265497 tp_is_empty!12151)))

(declare-fun b!453658 () Bool)

(declare-fun res!270228 () Bool)

(assert (=> b!453658 (=> (not res!270228) (not e!265498))))

(assert (=> b!453658 (= res!270228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!453659 () Bool)

(declare-fun res!270222 () Bool)

(assert (=> b!453659 (=> (not res!270222) (not e!265498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453659 (= res!270222 (validKeyInArray!0 k0!794))))

(declare-fun b!453660 () Bool)

(assert (=> b!453660 (= e!265501 (and e!265496 mapRes!19867))))

(declare-fun condMapEmpty!19867 () Bool)

(declare-fun mapDefault!19867 () ValueCell!5732)

(assert (=> b!453660 (= condMapEmpty!19867 (= (arr!13493 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5732)) mapDefault!19867)))))

(assert (= (and start!40864 res!270226) b!453649))

(assert (= (and b!453649 res!270223) b!453647))

(assert (= (and b!453647 res!270227) b!453658))

(assert (= (and b!453658 res!270228) b!453651))

(assert (= (and b!453651 res!270230) b!453652))

(assert (= (and b!453652 res!270224) b!453659))

(assert (= (and b!453659 res!270222) b!453655))

(assert (= (and b!453655 res!270219) b!453653))

(assert (= (and b!453653 res!270220) b!453656))

(assert (= (and b!453656 res!270221) b!453654))

(assert (= (and b!453654 res!270229) b!453648))

(assert (= (and b!453648 res!270225) b!453646))

(assert (= (and b!453660 condMapEmpty!19867) mapIsEmpty!19867))

(assert (= (and b!453660 (not condMapEmpty!19867)) mapNonEmpty!19867))

(get-info :version)

(assert (= (and mapNonEmpty!19867 ((_ is ValueCellFull!5732) mapValue!19867)) b!453657))

(assert (= (and b!453660 ((_ is ValueCellFull!5732) mapDefault!19867)) b!453650))

(assert (= start!40864 b!453660))

(declare-fun m!437477 () Bool)

(assert (=> mapNonEmpty!19867 m!437477))

(declare-fun m!437479 () Bool)

(assert (=> b!453658 m!437479))

(declare-fun m!437481 () Bool)

(assert (=> b!453651 m!437481))

(declare-fun m!437483 () Bool)

(assert (=> b!453646 m!437483))

(declare-fun m!437485 () Bool)

(assert (=> b!453646 m!437485))

(declare-fun m!437487 () Bool)

(assert (=> b!453646 m!437487))

(declare-fun m!437489 () Bool)

(assert (=> b!453654 m!437489))

(declare-fun m!437491 () Bool)

(assert (=> b!453656 m!437491))

(declare-fun m!437493 () Bool)

(assert (=> b!453656 m!437493))

(declare-fun m!437495 () Bool)

(assert (=> b!453659 m!437495))

(declare-fun m!437497 () Bool)

(assert (=> b!453653 m!437497))

(declare-fun m!437499 () Bool)

(assert (=> b!453655 m!437499))

(declare-fun m!437501 () Bool)

(assert (=> start!40864 m!437501))

(declare-fun m!437503 () Bool)

(assert (=> start!40864 m!437503))

(declare-fun m!437505 () Bool)

(assert (=> b!453649 m!437505))

(check-sat (not b!453646) b_and!18929 (not b_next!10813) (not b!453658) tp_is_empty!12151 (not b!453659) (not b!453656) (not mapNonEmpty!19867) (not start!40864) (not b!453654) (not b!453651) (not b!453653) (not b!453649))
(check-sat b_and!18929 (not b_next!10813))
