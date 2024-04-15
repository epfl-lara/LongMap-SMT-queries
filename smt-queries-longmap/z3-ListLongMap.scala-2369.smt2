; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37662 () Bool)

(assert start!37662)

(declare-fun b_free!8779 () Bool)

(declare-fun b_next!8779 () Bool)

(assert (=> start!37662 (= b_free!8779 (not b_next!8779))))

(declare-fun tp!31089 () Bool)

(declare-fun b_and!15995 () Bool)

(assert (=> start!37662 (= tp!31089 b_and!15995)))

(declare-fun b!385624 () Bool)

(declare-fun e!234007 () Bool)

(declare-fun e!234003 () Bool)

(assert (=> b!385624 (= e!234007 e!234003)))

(declare-fun res!220066 () Bool)

(assert (=> b!385624 (=> (not res!220066) (not e!234003))))

(declare-datatypes ((array!22787 0))(
  ( (array!22788 (arr!10862 (Array (_ BitVec 32) (_ BitVec 64))) (size!11215 (_ BitVec 32))) )
))
(declare-fun lt!181447 () array!22787)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22787 (_ BitVec 32)) Bool)

(assert (=> b!385624 (= res!220066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181447 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!22787)

(assert (=> b!385624 (= lt!181447 (array!22788 (store (arr!10862 _keys!658) i!548 k0!778) (size!11215 _keys!658)))))

(declare-fun b!385625 () Bool)

(declare-fun res!220059 () Bool)

(assert (=> b!385625 (=> (not res!220059) (not e!234007))))

(assert (=> b!385625 (= res!220059 (or (= (select (arr!10862 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10862 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!220061 () Bool)

(assert (=> start!37662 (=> (not res!220061) (not e!234007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37662 (= res!220061 (validMask!0 mask!970))))

(assert (=> start!37662 e!234007))

(declare-datatypes ((V!13707 0))(
  ( (V!13708 (val!4770 Int)) )
))
(declare-datatypes ((ValueCell!4382 0))(
  ( (ValueCellFull!4382 (v!6961 V!13707)) (EmptyCell!4382) )
))
(declare-datatypes ((array!22789 0))(
  ( (array!22790 (arr!10863 (Array (_ BitVec 32) ValueCell!4382)) (size!11216 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22789)

(declare-fun e!234005 () Bool)

(declare-fun array_inv!7992 (array!22789) Bool)

(assert (=> start!37662 (and (array_inv!7992 _values!506) e!234005)))

(assert (=> start!37662 tp!31089))

(assert (=> start!37662 true))

(declare-fun tp_is_empty!9451 () Bool)

(assert (=> start!37662 tp_is_empty!9451))

(declare-fun array_inv!7993 (array!22787) Bool)

(assert (=> start!37662 (array_inv!7993 _keys!658)))

(declare-fun b!385626 () Bool)

(declare-fun res!220060 () Bool)

(assert (=> b!385626 (=> (not res!220060) (not e!234007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385626 (= res!220060 (validKeyInArray!0 k0!778))))

(declare-fun b!385627 () Bool)

(declare-fun res!220063 () Bool)

(assert (=> b!385627 (=> (not res!220063) (not e!234007))))

(declare-datatypes ((List!6228 0))(
  ( (Nil!6225) (Cons!6224 (h!7080 (_ BitVec 64)) (t!11369 List!6228)) )
))
(declare-fun arrayNoDuplicates!0 (array!22787 (_ BitVec 32) List!6228) Bool)

(assert (=> b!385627 (= res!220063 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6225))))

(declare-fun b!385628 () Bool)

(declare-fun res!220064 () Bool)

(assert (=> b!385628 (=> (not res!220064) (not e!234003))))

(assert (=> b!385628 (= res!220064 (arrayNoDuplicates!0 lt!181447 #b00000000000000000000000000000000 Nil!6225))))

(declare-fun b!385629 () Bool)

(declare-fun res!220065 () Bool)

(assert (=> b!385629 (=> (not res!220065) (not e!234007))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385629 (= res!220065 (and (= (size!11216 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11215 _keys!658) (size!11216 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385630 () Bool)

(declare-fun res!220058 () Bool)

(assert (=> b!385630 (=> (not res!220058) (not e!234007))))

(declare-fun arrayContainsKey!0 (array!22787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385630 (= res!220058 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385631 () Bool)

(assert (=> b!385631 (= e!234003 (bvsgt #b00000000000000000000000000000000 (size!11215 _keys!658)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6396 0))(
  ( (tuple2!6397 (_1!3209 (_ BitVec 64)) (_2!3209 V!13707)) )
))
(declare-datatypes ((List!6229 0))(
  ( (Nil!6226) (Cons!6225 (h!7081 tuple2!6396) (t!11370 List!6229)) )
))
(declare-datatypes ((ListLongMap!5299 0))(
  ( (ListLongMap!5300 (toList!2665 List!6229)) )
))
(declare-fun lt!181449 () ListLongMap!5299)

(declare-fun zeroValue!472 () V!13707)

(declare-fun v!373 () V!13707)

(declare-fun minValue!472 () V!13707)

(declare-fun getCurrentListMapNoExtraKeys!905 (array!22787 array!22789 (_ BitVec 32) (_ BitVec 32) V!13707 V!13707 (_ BitVec 32) Int) ListLongMap!5299)

(assert (=> b!385631 (= lt!181449 (getCurrentListMapNoExtraKeys!905 lt!181447 (array!22790 (store (arr!10863 _values!506) i!548 (ValueCellFull!4382 v!373)) (size!11216 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181448 () ListLongMap!5299)

(assert (=> b!385631 (= lt!181448 (getCurrentListMapNoExtraKeys!905 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15741 () Bool)

(declare-fun mapRes!15741 () Bool)

(assert (=> mapIsEmpty!15741 mapRes!15741))

(declare-fun b!385632 () Bool)

(declare-fun e!234004 () Bool)

(assert (=> b!385632 (= e!234005 (and e!234004 mapRes!15741))))

(declare-fun condMapEmpty!15741 () Bool)

(declare-fun mapDefault!15741 () ValueCell!4382)

(assert (=> b!385632 (= condMapEmpty!15741 (= (arr!10863 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4382)) mapDefault!15741)))))

(declare-fun b!385633 () Bool)

(assert (=> b!385633 (= e!234004 tp_is_empty!9451)))

(declare-fun b!385634 () Bool)

(declare-fun res!220062 () Bool)

(assert (=> b!385634 (=> (not res!220062) (not e!234007))))

(assert (=> b!385634 (= res!220062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15741 () Bool)

(declare-fun tp!31088 () Bool)

(declare-fun e!234006 () Bool)

(assert (=> mapNonEmpty!15741 (= mapRes!15741 (and tp!31088 e!234006))))

(declare-fun mapKey!15741 () (_ BitVec 32))

(declare-fun mapRest!15741 () (Array (_ BitVec 32) ValueCell!4382))

(declare-fun mapValue!15741 () ValueCell!4382)

(assert (=> mapNonEmpty!15741 (= (arr!10863 _values!506) (store mapRest!15741 mapKey!15741 mapValue!15741))))

(declare-fun b!385635 () Bool)

(assert (=> b!385635 (= e!234006 tp_is_empty!9451)))

(declare-fun b!385636 () Bool)

(declare-fun res!220067 () Bool)

(assert (=> b!385636 (=> (not res!220067) (not e!234007))))

(assert (=> b!385636 (= res!220067 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11215 _keys!658))))))

(assert (= (and start!37662 res!220061) b!385629))

(assert (= (and b!385629 res!220065) b!385634))

(assert (= (and b!385634 res!220062) b!385627))

(assert (= (and b!385627 res!220063) b!385636))

(assert (= (and b!385636 res!220067) b!385626))

(assert (= (and b!385626 res!220060) b!385625))

(assert (= (and b!385625 res!220059) b!385630))

(assert (= (and b!385630 res!220058) b!385624))

(assert (= (and b!385624 res!220066) b!385628))

(assert (= (and b!385628 res!220064) b!385631))

(assert (= (and b!385632 condMapEmpty!15741) mapIsEmpty!15741))

(assert (= (and b!385632 (not condMapEmpty!15741)) mapNonEmpty!15741))

(get-info :version)

(assert (= (and mapNonEmpty!15741 ((_ is ValueCellFull!4382) mapValue!15741)) b!385635))

(assert (= (and b!385632 ((_ is ValueCellFull!4382) mapDefault!15741)) b!385633))

(assert (= start!37662 b!385632))

(declare-fun m!381641 () Bool)

(assert (=> b!385628 m!381641))

(declare-fun m!381643 () Bool)

(assert (=> start!37662 m!381643))

(declare-fun m!381645 () Bool)

(assert (=> start!37662 m!381645))

(declare-fun m!381647 () Bool)

(assert (=> start!37662 m!381647))

(declare-fun m!381649 () Bool)

(assert (=> b!385624 m!381649))

(declare-fun m!381651 () Bool)

(assert (=> b!385624 m!381651))

(declare-fun m!381653 () Bool)

(assert (=> b!385630 m!381653))

(declare-fun m!381655 () Bool)

(assert (=> b!385625 m!381655))

(declare-fun m!381657 () Bool)

(assert (=> b!385627 m!381657))

(declare-fun m!381659 () Bool)

(assert (=> b!385634 m!381659))

(declare-fun m!381661 () Bool)

(assert (=> mapNonEmpty!15741 m!381661))

(declare-fun m!381663 () Bool)

(assert (=> b!385631 m!381663))

(declare-fun m!381665 () Bool)

(assert (=> b!385631 m!381665))

(declare-fun m!381667 () Bool)

(assert (=> b!385631 m!381667))

(declare-fun m!381669 () Bool)

(assert (=> b!385626 m!381669))

(check-sat b_and!15995 (not mapNonEmpty!15741) (not b!385627) (not b!385624) (not b!385626) (not b!385628) (not start!37662) tp_is_empty!9451 (not b!385631) (not b!385630) (not b!385634) (not b_next!8779))
(check-sat b_and!15995 (not b_next!8779))
