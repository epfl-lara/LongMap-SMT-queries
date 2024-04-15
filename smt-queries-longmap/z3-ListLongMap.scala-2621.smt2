; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39530 () Bool)

(assert start!39530)

(declare-fun b_free!9811 () Bool)

(declare-fun b_next!9811 () Bool)

(assert (=> start!39530 (= b_free!9811 (not b_next!9811))))

(declare-fun tp!34961 () Bool)

(declare-fun b_and!17441 () Bool)

(assert (=> start!39530 (= tp!34961 b_and!17441)))

(declare-fun b!422723 () Bool)

(declare-fun res!246991 () Bool)

(declare-fun e!251387 () Bool)

(assert (=> b!422723 (=> (not res!246991) (not e!251387))))

(declare-datatypes ((array!25755 0))(
  ( (array!25756 (arr!12327 (Array (_ BitVec 32) (_ BitVec 64))) (size!12680 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25755)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422723 (= res!246991 (or (= (select (arr!12327 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12327 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422724 () Bool)

(declare-fun res!246998 () Bool)

(assert (=> b!422724 (=> (not res!246998) (not e!251387))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422724 (= res!246998 (validKeyInArray!0 k0!794))))

(declare-fun b!422725 () Bool)

(declare-fun res!246994 () Bool)

(declare-fun e!251388 () Bool)

(assert (=> b!422725 (=> (not res!246994) (not e!251388))))

(declare-fun lt!193847 () array!25755)

(declare-datatypes ((List!7236 0))(
  ( (Nil!7233) (Cons!7232 (h!8088 (_ BitVec 64)) (t!12671 List!7236)) )
))
(declare-fun arrayNoDuplicates!0 (array!25755 (_ BitVec 32) List!7236) Bool)

(assert (=> b!422725 (= res!246994 (arrayNoDuplicates!0 lt!193847 #b00000000000000000000000000000000 Nil!7233))))

(declare-fun b!422726 () Bool)

(assert (=> b!422726 (= e!251388 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15723 0))(
  ( (V!15724 (val!5526 Int)) )
))
(declare-datatypes ((tuple2!7244 0))(
  ( (tuple2!7245 (_1!3633 (_ BitVec 64)) (_2!3633 V!15723)) )
))
(declare-datatypes ((List!7237 0))(
  ( (Nil!7234) (Cons!7233 (h!8089 tuple2!7244) (t!12672 List!7237)) )
))
(declare-datatypes ((ListLongMap!6147 0))(
  ( (ListLongMap!6148 (toList!3089 List!7237)) )
))
(declare-fun lt!193845 () ListLongMap!6147)

(declare-fun minValue!515 () V!15723)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5138 0))(
  ( (ValueCellFull!5138 (v!7767 V!15723)) (EmptyCell!5138) )
))
(declare-datatypes ((array!25757 0))(
  ( (array!25758 (arr!12328 (Array (_ BitVec 32) ValueCell!5138)) (size!12681 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25757)

(declare-fun zeroValue!515 () V!15723)

(declare-fun v!412 () V!15723)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1297 (array!25755 array!25757 (_ BitVec 32) (_ BitVec 32) V!15723 V!15723 (_ BitVec 32) Int) ListLongMap!6147)

(assert (=> b!422726 (= lt!193845 (getCurrentListMapNoExtraKeys!1297 lt!193847 (array!25758 (store (arr!12328 _values!549) i!563 (ValueCellFull!5138 v!412)) (size!12681 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193846 () ListLongMap!6147)

(assert (=> b!422726 (= lt!193846 (getCurrentListMapNoExtraKeys!1297 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422727 () Bool)

(declare-fun res!247000 () Bool)

(assert (=> b!422727 (=> (not res!247000) (not e!251387))))

(assert (=> b!422727 (= res!247000 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12680 _keys!709))))))

(declare-fun b!422728 () Bool)

(declare-fun res!246993 () Bool)

(assert (=> b!422728 (=> (not res!246993) (not e!251387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25755 (_ BitVec 32)) Bool)

(assert (=> b!422728 (= res!246993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422729 () Bool)

(declare-fun res!246997 () Bool)

(assert (=> b!422729 (=> (not res!246997) (not e!251387))))

(assert (=> b!422729 (= res!246997 (and (= (size!12681 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12680 _keys!709) (size!12681 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422730 () Bool)

(declare-fun e!251385 () Bool)

(declare-fun tp_is_empty!10963 () Bool)

(assert (=> b!422730 (= e!251385 tp_is_empty!10963)))

(declare-fun b!422731 () Bool)

(declare-fun res!246995 () Bool)

(assert (=> b!422731 (=> (not res!246995) (not e!251387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422731 (= res!246995 (validMask!0 mask!1025))))

(declare-fun b!422732 () Bool)

(declare-fun res!246992 () Bool)

(assert (=> b!422732 (=> (not res!246992) (not e!251387))))

(assert (=> b!422732 (= res!246992 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7233))))

(declare-fun b!422733 () Bool)

(declare-fun res!246996 () Bool)

(assert (=> b!422733 (=> (not res!246996) (not e!251388))))

(assert (=> b!422733 (= res!246996 (bvsle from!863 i!563))))

(declare-fun b!422734 () Bool)

(declare-fun e!251384 () Bool)

(declare-fun mapRes!18066 () Bool)

(assert (=> b!422734 (= e!251384 (and e!251385 mapRes!18066))))

(declare-fun condMapEmpty!18066 () Bool)

(declare-fun mapDefault!18066 () ValueCell!5138)

(assert (=> b!422734 (= condMapEmpty!18066 (= (arr!12328 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5138)) mapDefault!18066)))))

(declare-fun res!247002 () Bool)

(assert (=> start!39530 (=> (not res!247002) (not e!251387))))

(assert (=> start!39530 (= res!247002 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12680 _keys!709))))))

(assert (=> start!39530 e!251387))

(assert (=> start!39530 tp_is_empty!10963))

(assert (=> start!39530 tp!34961))

(assert (=> start!39530 true))

(declare-fun array_inv!9016 (array!25757) Bool)

(assert (=> start!39530 (and (array_inv!9016 _values!549) e!251384)))

(declare-fun array_inv!9017 (array!25755) Bool)

(assert (=> start!39530 (array_inv!9017 _keys!709)))

(declare-fun mapIsEmpty!18066 () Bool)

(assert (=> mapIsEmpty!18066 mapRes!18066))

(declare-fun b!422735 () Bool)

(declare-fun res!246999 () Bool)

(assert (=> b!422735 (=> (not res!246999) (not e!251387))))

(declare-fun arrayContainsKey!0 (array!25755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422735 (= res!246999 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18066 () Bool)

(declare-fun tp!34962 () Bool)

(declare-fun e!251383 () Bool)

(assert (=> mapNonEmpty!18066 (= mapRes!18066 (and tp!34962 e!251383))))

(declare-fun mapKey!18066 () (_ BitVec 32))

(declare-fun mapRest!18066 () (Array (_ BitVec 32) ValueCell!5138))

(declare-fun mapValue!18066 () ValueCell!5138)

(assert (=> mapNonEmpty!18066 (= (arr!12328 _values!549) (store mapRest!18066 mapKey!18066 mapValue!18066))))

(declare-fun b!422736 () Bool)

(assert (=> b!422736 (= e!251383 tp_is_empty!10963)))

(declare-fun b!422737 () Bool)

(assert (=> b!422737 (= e!251387 e!251388)))

(declare-fun res!247001 () Bool)

(assert (=> b!422737 (=> (not res!247001) (not e!251388))))

(assert (=> b!422737 (= res!247001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193847 mask!1025))))

(assert (=> b!422737 (= lt!193847 (array!25756 (store (arr!12327 _keys!709) i!563 k0!794) (size!12680 _keys!709)))))

(assert (= (and start!39530 res!247002) b!422731))

(assert (= (and b!422731 res!246995) b!422729))

(assert (= (and b!422729 res!246997) b!422728))

(assert (= (and b!422728 res!246993) b!422732))

(assert (= (and b!422732 res!246992) b!422727))

(assert (= (and b!422727 res!247000) b!422724))

(assert (= (and b!422724 res!246998) b!422723))

(assert (= (and b!422723 res!246991) b!422735))

(assert (= (and b!422735 res!246999) b!422737))

(assert (= (and b!422737 res!247001) b!422725))

(assert (= (and b!422725 res!246994) b!422733))

(assert (= (and b!422733 res!246996) b!422726))

(assert (= (and b!422734 condMapEmpty!18066) mapIsEmpty!18066))

(assert (= (and b!422734 (not condMapEmpty!18066)) mapNonEmpty!18066))

(get-info :version)

(assert (= (and mapNonEmpty!18066 ((_ is ValueCellFull!5138) mapValue!18066)) b!422736))

(assert (= (and b!422734 ((_ is ValueCellFull!5138) mapDefault!18066)) b!422730))

(assert (= start!39530 b!422734))

(declare-fun m!411891 () Bool)

(assert (=> b!422732 m!411891))

(declare-fun m!411893 () Bool)

(assert (=> b!422735 m!411893))

(declare-fun m!411895 () Bool)

(assert (=> b!422737 m!411895))

(declare-fun m!411897 () Bool)

(assert (=> b!422737 m!411897))

(declare-fun m!411899 () Bool)

(assert (=> b!422724 m!411899))

(declare-fun m!411901 () Bool)

(assert (=> b!422726 m!411901))

(declare-fun m!411903 () Bool)

(assert (=> b!422726 m!411903))

(declare-fun m!411905 () Bool)

(assert (=> b!422726 m!411905))

(declare-fun m!411907 () Bool)

(assert (=> mapNonEmpty!18066 m!411907))

(declare-fun m!411909 () Bool)

(assert (=> b!422723 m!411909))

(declare-fun m!411911 () Bool)

(assert (=> b!422725 m!411911))

(declare-fun m!411913 () Bool)

(assert (=> start!39530 m!411913))

(declare-fun m!411915 () Bool)

(assert (=> start!39530 m!411915))

(declare-fun m!411917 () Bool)

(assert (=> b!422731 m!411917))

(declare-fun m!411919 () Bool)

(assert (=> b!422728 m!411919))

(check-sat (not b!422737) (not b!422728) (not start!39530) tp_is_empty!10963 (not mapNonEmpty!18066) (not b!422732) (not b!422724) b_and!17441 (not b_next!9811) (not b!422735) (not b!422725) (not b!422731) (not b!422726))
(check-sat b_and!17441 (not b_next!9811))
