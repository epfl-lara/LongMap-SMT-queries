; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20818 () Bool)

(assert start!20818)

(declare-fun b_free!5467 () Bool)

(declare-fun b_next!5467 () Bool)

(assert (=> start!20818 (= b_free!5467 (not b_next!5467))))

(declare-fun tp!19442 () Bool)

(declare-fun b_and!12187 () Bool)

(assert (=> start!20818 (= tp!19442 b_and!12187)))

(declare-fun b!208523 () Bool)

(declare-fun e!135959 () Bool)

(assert (=> b!208523 (= e!135959 false)))

(declare-datatypes ((V!6753 0))(
  ( (V!6754 (val!2709 Int)) )
))
(declare-datatypes ((ValueCell!2321 0))(
  ( (ValueCellFull!2321 (v!4673 V!6753)) (EmptyCell!2321) )
))
(declare-datatypes ((array!9847 0))(
  ( (array!9848 (arr!4673 (Array (_ BitVec 32) ValueCell!2321)) (size!4999 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9847)

(declare-fun v!520 () V!6753)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6753)

(declare-datatypes ((array!9849 0))(
  ( (array!9850 (arr!4674 (Array (_ BitVec 32) (_ BitVec 64))) (size!5000 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9849)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6753)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4080 0))(
  ( (tuple2!4081 (_1!2051 (_ BitVec 64)) (_2!2051 V!6753)) )
))
(declare-datatypes ((List!2987 0))(
  ( (Nil!2984) (Cons!2983 (h!3625 tuple2!4080) (t!7909 List!2987)) )
))
(declare-datatypes ((ListLongMap!2983 0))(
  ( (ListLongMap!2984 (toList!1507 List!2987)) )
))
(declare-fun lt!106652 () ListLongMap!2983)

(declare-fun getCurrentListMapNoExtraKeys!458 (array!9849 array!9847 (_ BitVec 32) (_ BitVec 32) V!6753 V!6753 (_ BitVec 32) Int) ListLongMap!2983)

(assert (=> b!208523 (= lt!106652 (getCurrentListMapNoExtraKeys!458 _keys!825 (array!9848 (store (arr!4673 _values!649) i!601 (ValueCellFull!2321 v!520)) (size!4999 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106651 () ListLongMap!2983)

(assert (=> b!208523 (= lt!106651 (getCurrentListMapNoExtraKeys!458 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208524 () Bool)

(declare-fun e!135960 () Bool)

(declare-fun tp_is_empty!5329 () Bool)

(assert (=> b!208524 (= e!135960 tp_is_empty!5329)))

(declare-fun b!208525 () Bool)

(declare-fun res!101467 () Bool)

(assert (=> b!208525 (=> (not res!101467) (not e!135959))))

(assert (=> b!208525 (= res!101467 (and (= (size!4999 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5000 _keys!825) (size!4999 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208526 () Bool)

(declare-fun e!135963 () Bool)

(assert (=> b!208526 (= e!135963 tp_is_empty!5329)))

(declare-fun b!208527 () Bool)

(declare-fun res!101466 () Bool)

(assert (=> b!208527 (=> (not res!101466) (not e!135959))))

(declare-datatypes ((List!2988 0))(
  ( (Nil!2985) (Cons!2984 (h!3626 (_ BitVec 64)) (t!7910 List!2988)) )
))
(declare-fun arrayNoDuplicates!0 (array!9849 (_ BitVec 32) List!2988) Bool)

(assert (=> b!208527 (= res!101466 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2985))))

(declare-fun b!208529 () Bool)

(declare-fun res!101468 () Bool)

(assert (=> b!208529 (=> (not res!101468) (not e!135959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9849 (_ BitVec 32)) Bool)

(assert (=> b!208529 (= res!101468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208530 () Bool)

(declare-fun res!101463 () Bool)

(assert (=> b!208530 (=> (not res!101463) (not e!135959))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!208530 (= res!101463 (= (select (arr!4674 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9062 () Bool)

(declare-fun mapRes!9062 () Bool)

(declare-fun tp!19441 () Bool)

(assert (=> mapNonEmpty!9062 (= mapRes!9062 (and tp!19441 e!135963))))

(declare-fun mapValue!9062 () ValueCell!2321)

(declare-fun mapRest!9062 () (Array (_ BitVec 32) ValueCell!2321))

(declare-fun mapKey!9062 () (_ BitVec 32))

(assert (=> mapNonEmpty!9062 (= (arr!4673 _values!649) (store mapRest!9062 mapKey!9062 mapValue!9062))))

(declare-fun b!208531 () Bool)

(declare-fun res!101464 () Bool)

(assert (=> b!208531 (=> (not res!101464) (not e!135959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208531 (= res!101464 (validKeyInArray!0 k0!843))))

(declare-fun b!208532 () Bool)

(declare-fun e!135962 () Bool)

(assert (=> b!208532 (= e!135962 (and e!135960 mapRes!9062))))

(declare-fun condMapEmpty!9062 () Bool)

(declare-fun mapDefault!9062 () ValueCell!2321)

(assert (=> b!208532 (= condMapEmpty!9062 (= (arr!4673 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2321)) mapDefault!9062)))))

(declare-fun mapIsEmpty!9062 () Bool)

(assert (=> mapIsEmpty!9062 mapRes!9062))

(declare-fun b!208528 () Bool)

(declare-fun res!101462 () Bool)

(assert (=> b!208528 (=> (not res!101462) (not e!135959))))

(assert (=> b!208528 (= res!101462 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5000 _keys!825))))))

(declare-fun res!101465 () Bool)

(assert (=> start!20818 (=> (not res!101465) (not e!135959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20818 (= res!101465 (validMask!0 mask!1149))))

(assert (=> start!20818 e!135959))

(declare-fun array_inv!3071 (array!9847) Bool)

(assert (=> start!20818 (and (array_inv!3071 _values!649) e!135962)))

(assert (=> start!20818 true))

(assert (=> start!20818 tp_is_empty!5329))

(declare-fun array_inv!3072 (array!9849) Bool)

(assert (=> start!20818 (array_inv!3072 _keys!825)))

(assert (=> start!20818 tp!19442))

(assert (= (and start!20818 res!101465) b!208525))

(assert (= (and b!208525 res!101467) b!208529))

(assert (= (and b!208529 res!101468) b!208527))

(assert (= (and b!208527 res!101466) b!208528))

(assert (= (and b!208528 res!101462) b!208531))

(assert (= (and b!208531 res!101464) b!208530))

(assert (= (and b!208530 res!101463) b!208523))

(assert (= (and b!208532 condMapEmpty!9062) mapIsEmpty!9062))

(assert (= (and b!208532 (not condMapEmpty!9062)) mapNonEmpty!9062))

(get-info :version)

(assert (= (and mapNonEmpty!9062 ((_ is ValueCellFull!2321) mapValue!9062)) b!208526))

(assert (= (and b!208532 ((_ is ValueCellFull!2321) mapDefault!9062)) b!208524))

(assert (= start!20818 b!208532))

(declare-fun m!235623 () Bool)

(assert (=> start!20818 m!235623))

(declare-fun m!235625 () Bool)

(assert (=> start!20818 m!235625))

(declare-fun m!235627 () Bool)

(assert (=> start!20818 m!235627))

(declare-fun m!235629 () Bool)

(assert (=> b!208523 m!235629))

(declare-fun m!235631 () Bool)

(assert (=> b!208523 m!235631))

(declare-fun m!235633 () Bool)

(assert (=> b!208523 m!235633))

(declare-fun m!235635 () Bool)

(assert (=> mapNonEmpty!9062 m!235635))

(declare-fun m!235637 () Bool)

(assert (=> b!208529 m!235637))

(declare-fun m!235639 () Bool)

(assert (=> b!208530 m!235639))

(declare-fun m!235641 () Bool)

(assert (=> b!208527 m!235641))

(declare-fun m!235643 () Bool)

(assert (=> b!208531 m!235643))

(check-sat (not b!208531) b_and!12187 (not b!208527) tp_is_empty!5329 (not start!20818) (not mapNonEmpty!9062) (not b!208523) (not b!208529) (not b_next!5467))
(check-sat b_and!12187 (not b_next!5467))
