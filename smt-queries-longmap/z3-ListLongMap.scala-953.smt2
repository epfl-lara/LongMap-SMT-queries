; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20818 () Bool)

(assert start!20818)

(declare-fun b_free!5467 () Bool)

(declare-fun b_next!5467 () Bool)

(assert (=> start!20818 (= b_free!5467 (not b_next!5467))))

(declare-fun tp!19441 () Bool)

(declare-fun b_and!12227 () Bool)

(assert (=> start!20818 (= tp!19441 b_and!12227)))

(declare-fun res!101584 () Bool)

(declare-fun e!136085 () Bool)

(assert (=> start!20818 (=> (not res!101584) (not e!136085))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20818 (= res!101584 (validMask!0 mask!1149))))

(assert (=> start!20818 e!136085))

(declare-datatypes ((V!6753 0))(
  ( (V!6754 (val!2709 Int)) )
))
(declare-datatypes ((ValueCell!2321 0))(
  ( (ValueCellFull!2321 (v!4680 V!6753)) (EmptyCell!2321) )
))
(declare-datatypes ((array!9853 0))(
  ( (array!9854 (arr!4677 (Array (_ BitVec 32) ValueCell!2321)) (size!5002 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9853)

(declare-fun e!136084 () Bool)

(declare-fun array_inv!3065 (array!9853) Bool)

(assert (=> start!20818 (and (array_inv!3065 _values!649) e!136084)))

(assert (=> start!20818 true))

(declare-fun tp_is_empty!5329 () Bool)

(assert (=> start!20818 tp_is_empty!5329))

(declare-datatypes ((array!9855 0))(
  ( (array!9856 (arr!4678 (Array (_ BitVec 32) (_ BitVec 64))) (size!5003 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9855)

(declare-fun array_inv!3066 (array!9855) Bool)

(assert (=> start!20818 (array_inv!3066 _keys!825)))

(assert (=> start!20818 tp!19441))

(declare-fun b!208717 () Bool)

(declare-fun res!101581 () Bool)

(assert (=> b!208717 (=> (not res!101581) (not e!136085))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208717 (= res!101581 (= (select (arr!4678 _keys!825) i!601) k0!843))))

(declare-fun b!208718 () Bool)

(declare-fun res!101582 () Bool)

(assert (=> b!208718 (=> (not res!101582) (not e!136085))))

(declare-datatypes ((List!2929 0))(
  ( (Nil!2926) (Cons!2925 (h!3567 (_ BitVec 64)) (t!7852 List!2929)) )
))
(declare-fun arrayNoDuplicates!0 (array!9855 (_ BitVec 32) List!2929) Bool)

(assert (=> b!208718 (= res!101582 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2926))))

(declare-fun mapNonEmpty!9062 () Bool)

(declare-fun mapRes!9062 () Bool)

(declare-fun tp!19442 () Bool)

(declare-fun e!136088 () Bool)

(assert (=> mapNonEmpty!9062 (= mapRes!9062 (and tp!19442 e!136088))))

(declare-fun mapRest!9062 () (Array (_ BitVec 32) ValueCell!2321))

(declare-fun mapKey!9062 () (_ BitVec 32))

(declare-fun mapValue!9062 () ValueCell!2321)

(assert (=> mapNonEmpty!9062 (= (arr!4677 _values!649) (store mapRest!9062 mapKey!9062 mapValue!9062))))

(declare-fun b!208719 () Bool)

(assert (=> b!208719 (= e!136085 false)))

(declare-datatypes ((tuple2!4040 0))(
  ( (tuple2!4041 (_1!2031 (_ BitVec 64)) (_2!2031 V!6753)) )
))
(declare-datatypes ((List!2930 0))(
  ( (Nil!2927) (Cons!2926 (h!3568 tuple2!4040) (t!7853 List!2930)) )
))
(declare-datatypes ((ListLongMap!2955 0))(
  ( (ListLongMap!2956 (toList!1493 List!2930)) )
))
(declare-fun lt!106891 () ListLongMap!2955)

(declare-fun v!520 () V!6753)

(declare-fun zeroValue!615 () V!6753)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6753)

(declare-fun getCurrentListMapNoExtraKeys!456 (array!9855 array!9853 (_ BitVec 32) (_ BitVec 32) V!6753 V!6753 (_ BitVec 32) Int) ListLongMap!2955)

(assert (=> b!208719 (= lt!106891 (getCurrentListMapNoExtraKeys!456 _keys!825 (array!9854 (store (arr!4677 _values!649) i!601 (ValueCellFull!2321 v!520)) (size!5002 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106892 () ListLongMap!2955)

(assert (=> b!208719 (= lt!106892 (getCurrentListMapNoExtraKeys!456 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208720 () Bool)

(declare-fun res!101578 () Bool)

(assert (=> b!208720 (=> (not res!101578) (not e!136085))))

(assert (=> b!208720 (= res!101578 (and (= (size!5002 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5003 _keys!825) (size!5002 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208721 () Bool)

(declare-fun res!101580 () Bool)

(assert (=> b!208721 (=> (not res!101580) (not e!136085))))

(assert (=> b!208721 (= res!101580 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5003 _keys!825))))))

(declare-fun b!208722 () Bool)

(assert (=> b!208722 (= e!136088 tp_is_empty!5329)))

(declare-fun b!208723 () Bool)

(declare-fun e!136086 () Bool)

(assert (=> b!208723 (= e!136084 (and e!136086 mapRes!9062))))

(declare-fun condMapEmpty!9062 () Bool)

(declare-fun mapDefault!9062 () ValueCell!2321)

(assert (=> b!208723 (= condMapEmpty!9062 (= (arr!4677 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2321)) mapDefault!9062)))))

(declare-fun b!208724 () Bool)

(declare-fun res!101579 () Bool)

(assert (=> b!208724 (=> (not res!101579) (not e!136085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208724 (= res!101579 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!9062 () Bool)

(assert (=> mapIsEmpty!9062 mapRes!9062))

(declare-fun b!208725 () Bool)

(assert (=> b!208725 (= e!136086 tp_is_empty!5329)))

(declare-fun b!208726 () Bool)

(declare-fun res!101583 () Bool)

(assert (=> b!208726 (=> (not res!101583) (not e!136085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9855 (_ BitVec 32)) Bool)

(assert (=> b!208726 (= res!101583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20818 res!101584) b!208720))

(assert (= (and b!208720 res!101578) b!208726))

(assert (= (and b!208726 res!101583) b!208718))

(assert (= (and b!208718 res!101582) b!208721))

(assert (= (and b!208721 res!101580) b!208724))

(assert (= (and b!208724 res!101579) b!208717))

(assert (= (and b!208717 res!101581) b!208719))

(assert (= (and b!208723 condMapEmpty!9062) mapIsEmpty!9062))

(assert (= (and b!208723 (not condMapEmpty!9062)) mapNonEmpty!9062))

(get-info :version)

(assert (= (and mapNonEmpty!9062 ((_ is ValueCellFull!2321) mapValue!9062)) b!208722))

(assert (= (and b!208723 ((_ is ValueCellFull!2321) mapDefault!9062)) b!208725))

(assert (= start!20818 b!208723))

(declare-fun m!236421 () Bool)

(assert (=> b!208718 m!236421))

(declare-fun m!236423 () Bool)

(assert (=> b!208724 m!236423))

(declare-fun m!236425 () Bool)

(assert (=> start!20818 m!236425))

(declare-fun m!236427 () Bool)

(assert (=> start!20818 m!236427))

(declare-fun m!236429 () Bool)

(assert (=> start!20818 m!236429))

(declare-fun m!236431 () Bool)

(assert (=> b!208726 m!236431))

(declare-fun m!236433 () Bool)

(assert (=> mapNonEmpty!9062 m!236433))

(declare-fun m!236435 () Bool)

(assert (=> b!208717 m!236435))

(declare-fun m!236437 () Bool)

(assert (=> b!208719 m!236437))

(declare-fun m!236439 () Bool)

(assert (=> b!208719 m!236439))

(declare-fun m!236441 () Bool)

(assert (=> b!208719 m!236441))

(check-sat (not b!208719) (not b!208718) b_and!12227 (not start!20818) (not b!208726) (not b!208724) tp_is_empty!5329 (not b_next!5467) (not mapNonEmpty!9062))
(check-sat b_and!12227 (not b_next!5467))
