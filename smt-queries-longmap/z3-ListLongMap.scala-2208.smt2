; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36648 () Bool)

(assert start!36648)

(declare-fun b!365824 () Bool)

(declare-fun res!204580 () Bool)

(declare-fun e!224034 () Bool)

(assert (=> b!365824 (=> (not res!204580) (not e!224034))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365824 (= res!204580 (validKeyInArray!0 k0!778))))

(declare-fun b!365825 () Bool)

(declare-fun res!204577 () Bool)

(assert (=> b!365825 (=> (not res!204577) (not e!224034))))

(declare-datatypes ((array!20916 0))(
  ( (array!20917 (arr!9929 (Array (_ BitVec 32) (_ BitVec 64))) (size!10281 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20916)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20916 (_ BitVec 32)) Bool)

(assert (=> b!365825 (= res!204577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365826 () Bool)

(declare-fun res!204578 () Bool)

(assert (=> b!365826 (=> (not res!204578) (not e!224034))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365826 (= res!204578 (or (= (select (arr!9929 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9929 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!204579 () Bool)

(assert (=> start!36648 (=> (not res!204579) (not e!224034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36648 (= res!204579 (validMask!0 mask!970))))

(assert (=> start!36648 e!224034))

(assert (=> start!36648 true))

(declare-datatypes ((V!12419 0))(
  ( (V!12420 (val!4287 Int)) )
))
(declare-datatypes ((ValueCell!3899 0))(
  ( (ValueCellFull!3899 (v!6484 V!12419)) (EmptyCell!3899) )
))
(declare-datatypes ((array!20918 0))(
  ( (array!20919 (arr!9930 (Array (_ BitVec 32) ValueCell!3899)) (size!10282 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20918)

(declare-fun e!224038 () Bool)

(declare-fun array_inv!7388 (array!20918) Bool)

(assert (=> start!36648 (and (array_inv!7388 _values!506) e!224038)))

(declare-fun array_inv!7389 (array!20916) Bool)

(assert (=> start!36648 (array_inv!7389 _keys!658)))

(declare-fun mapIsEmpty!14283 () Bool)

(declare-fun mapRes!14283 () Bool)

(assert (=> mapIsEmpty!14283 mapRes!14283))

(declare-fun mapNonEmpty!14283 () Bool)

(declare-fun tp!28359 () Bool)

(declare-fun e!224035 () Bool)

(assert (=> mapNonEmpty!14283 (= mapRes!14283 (and tp!28359 e!224035))))

(declare-fun mapKey!14283 () (_ BitVec 32))

(declare-fun mapRest!14283 () (Array (_ BitVec 32) ValueCell!3899))

(declare-fun mapValue!14283 () ValueCell!3899)

(assert (=> mapNonEmpty!14283 (= (arr!9930 _values!506) (store mapRest!14283 mapKey!14283 mapValue!14283))))

(declare-fun b!365827 () Bool)

(declare-fun res!204576 () Bool)

(assert (=> b!365827 (=> (not res!204576) (not e!224034))))

(declare-datatypes ((List!5447 0))(
  ( (Nil!5444) (Cons!5443 (h!6299 (_ BitVec 64)) (t!10589 List!5447)) )
))
(declare-fun arrayNoDuplicates!0 (array!20916 (_ BitVec 32) List!5447) Bool)

(assert (=> b!365827 (= res!204576 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5444))))

(declare-fun b!365828 () Bool)

(declare-fun res!204582 () Bool)

(assert (=> b!365828 (=> (not res!204582) (not e!224034))))

(assert (=> b!365828 (= res!204582 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10281 _keys!658))))))

(declare-fun b!365829 () Bool)

(declare-fun res!204575 () Bool)

(assert (=> b!365829 (=> (not res!204575) (not e!224034))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365829 (= res!204575 (and (= (size!10282 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10281 _keys!658) (size!10282 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365830 () Bool)

(declare-fun tp_is_empty!8485 () Bool)

(assert (=> b!365830 (= e!224035 tp_is_empty!8485)))

(declare-fun b!365831 () Bool)

(declare-fun res!204581 () Bool)

(assert (=> b!365831 (=> (not res!204581) (not e!224034))))

(declare-fun arrayContainsKey!0 (array!20916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365831 (= res!204581 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!365832 () Bool)

(declare-fun e!224036 () Bool)

(assert (=> b!365832 (= e!224036 tp_is_empty!8485)))

(declare-fun b!365833 () Bool)

(assert (=> b!365833 (= e!224038 (and e!224036 mapRes!14283))))

(declare-fun condMapEmpty!14283 () Bool)

(declare-fun mapDefault!14283 () ValueCell!3899)

(assert (=> b!365833 (= condMapEmpty!14283 (= (arr!9930 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3899)) mapDefault!14283)))))

(declare-fun b!365834 () Bool)

(assert (=> b!365834 (= e!224034 (not (= (size!10281 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970))))))

(assert (= (and start!36648 res!204579) b!365829))

(assert (= (and b!365829 res!204575) b!365825))

(assert (= (and b!365825 res!204577) b!365827))

(assert (= (and b!365827 res!204576) b!365828))

(assert (= (and b!365828 res!204582) b!365824))

(assert (= (and b!365824 res!204580) b!365826))

(assert (= (and b!365826 res!204578) b!365831))

(assert (= (and b!365831 res!204581) b!365834))

(assert (= (and b!365833 condMapEmpty!14283) mapIsEmpty!14283))

(assert (= (and b!365833 (not condMapEmpty!14283)) mapNonEmpty!14283))

(get-info :version)

(assert (= (and mapNonEmpty!14283 ((_ is ValueCellFull!3899) mapValue!14283)) b!365830))

(assert (= (and b!365833 ((_ is ValueCellFull!3899) mapDefault!14283)) b!365832))

(assert (= start!36648 b!365833))

(declare-fun m!363647 () Bool)

(assert (=> b!365826 m!363647))

(declare-fun m!363649 () Bool)

(assert (=> b!365827 m!363649))

(declare-fun m!363651 () Bool)

(assert (=> b!365824 m!363651))

(declare-fun m!363653 () Bool)

(assert (=> b!365825 m!363653))

(declare-fun m!363655 () Bool)

(assert (=> b!365831 m!363655))

(declare-fun m!363657 () Bool)

(assert (=> mapNonEmpty!14283 m!363657))

(declare-fun m!363659 () Bool)

(assert (=> start!36648 m!363659))

(declare-fun m!363661 () Bool)

(assert (=> start!36648 m!363661))

(declare-fun m!363663 () Bool)

(assert (=> start!36648 m!363663))

(check-sat (not b!365831) (not b!365825) tp_is_empty!8485 (not mapNonEmpty!14283) (not b!365827) (not b!365824) (not start!36648))
(check-sat)
