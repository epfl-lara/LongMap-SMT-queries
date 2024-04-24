; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37704 () Bool)

(assert start!37704)

(declare-fun b_free!8821 () Bool)

(declare-fun b_next!8821 () Bool)

(assert (=> start!37704 (= b_free!8821 (not b_next!8821))))

(declare-fun tp!31214 () Bool)

(declare-fun b_and!16077 () Bool)

(assert (=> start!37704 (= tp!31214 b_and!16077)))

(declare-fun b!386665 () Bool)

(declare-fun res!220815 () Bool)

(declare-fun e!234523 () Bool)

(assert (=> b!386665 (=> (not res!220815) (not e!234523))))

(declare-datatypes ((array!22872 0))(
  ( (array!22873 (arr!10904 (Array (_ BitVec 32) (_ BitVec 64))) (size!11256 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22872)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386665 (= res!220815 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386666 () Bool)

(declare-fun res!220818 () Bool)

(assert (=> b!386666 (=> (not res!220818) (not e!234523))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13763 0))(
  ( (V!13764 (val!4791 Int)) )
))
(declare-datatypes ((ValueCell!4403 0))(
  ( (ValueCellFull!4403 (v!6989 V!13763)) (EmptyCell!4403) )
))
(declare-datatypes ((array!22874 0))(
  ( (array!22875 (arr!10905 (Array (_ BitVec 32) ValueCell!4403)) (size!11257 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22874)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!386666 (= res!220818 (and (= (size!11257 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11256 _keys!658) (size!11257 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386667 () Bool)

(declare-fun res!220819 () Bool)

(assert (=> b!386667 (=> (not res!220819) (not e!234523))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386667 (= res!220819 (or (= (select (arr!10904 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10904 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386668 () Bool)

(declare-fun res!220821 () Bool)

(assert (=> b!386668 (=> (not res!220821) (not e!234523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386668 (= res!220821 (validKeyInArray!0 k0!778))))

(declare-fun b!386669 () Bool)

(declare-fun res!220823 () Bool)

(assert (=> b!386669 (=> (not res!220823) (not e!234523))))

(declare-datatypes ((List!6154 0))(
  ( (Nil!6151) (Cons!6150 (h!7006 (_ BitVec 64)) (t!11296 List!6154)) )
))
(declare-fun arrayNoDuplicates!0 (array!22872 (_ BitVec 32) List!6154) Bool)

(assert (=> b!386669 (= res!220823 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6151))))

(declare-fun b!386670 () Bool)

(declare-fun e!234524 () Bool)

(declare-fun tp_is_empty!9493 () Bool)

(assert (=> b!386670 (= e!234524 tp_is_empty!9493)))

(declare-fun mapNonEmpty!15804 () Bool)

(declare-fun mapRes!15804 () Bool)

(declare-fun tp!31215 () Bool)

(declare-fun e!234527 () Bool)

(assert (=> mapNonEmpty!15804 (= mapRes!15804 (and tp!31215 e!234527))))

(declare-fun mapKey!15804 () (_ BitVec 32))

(declare-fun mapRest!15804 () (Array (_ BitVec 32) ValueCell!4403))

(declare-fun mapValue!15804 () ValueCell!4403)

(assert (=> mapNonEmpty!15804 (= (arr!10905 _values!506) (store mapRest!15804 mapKey!15804 mapValue!15804))))

(declare-fun b!386671 () Bool)

(declare-fun e!234525 () Bool)

(assert (=> b!386671 (= e!234523 e!234525)))

(declare-fun res!220816 () Bool)

(assert (=> b!386671 (=> (not res!220816) (not e!234525))))

(declare-fun lt!181889 () array!22872)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22872 (_ BitVec 32)) Bool)

(assert (=> b!386671 (= res!220816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181889 mask!970))))

(assert (=> b!386671 (= lt!181889 (array!22873 (store (arr!10904 _keys!658) i!548 k0!778) (size!11256 _keys!658)))))

(declare-fun b!386672 () Bool)

(assert (=> b!386672 (= e!234527 tp_is_empty!9493)))

(declare-fun mapIsEmpty!15804 () Bool)

(assert (=> mapIsEmpty!15804 mapRes!15804))

(declare-fun res!220814 () Bool)

(assert (=> start!37704 (=> (not res!220814) (not e!234523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37704 (= res!220814 (validMask!0 mask!970))))

(assert (=> start!37704 e!234523))

(declare-fun e!234526 () Bool)

(declare-fun array_inv!8058 (array!22874) Bool)

(assert (=> start!37704 (and (array_inv!8058 _values!506) e!234526)))

(assert (=> start!37704 tp!31214))

(assert (=> start!37704 true))

(assert (=> start!37704 tp_is_empty!9493))

(declare-fun array_inv!8059 (array!22872) Bool)

(assert (=> start!37704 (array_inv!8059 _keys!658)))

(declare-fun b!386673 () Bool)

(assert (=> b!386673 (= e!234525 false)))

(declare-datatypes ((tuple2!6306 0))(
  ( (tuple2!6307 (_1!3164 (_ BitVec 64)) (_2!3164 V!13763)) )
))
(declare-datatypes ((List!6155 0))(
  ( (Nil!6152) (Cons!6151 (h!7007 tuple2!6306) (t!11297 List!6155)) )
))
(declare-datatypes ((ListLongMap!5221 0))(
  ( (ListLongMap!5222 (toList!2626 List!6155)) )
))
(declare-fun lt!181891 () ListLongMap!5221)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13763)

(declare-fun v!373 () V!13763)

(declare-fun minValue!472 () V!13763)

(declare-fun getCurrentListMapNoExtraKeys!901 (array!22872 array!22874 (_ BitVec 32) (_ BitVec 32) V!13763 V!13763 (_ BitVec 32) Int) ListLongMap!5221)

(assert (=> b!386673 (= lt!181891 (getCurrentListMapNoExtraKeys!901 lt!181889 (array!22875 (store (arr!10905 _values!506) i!548 (ValueCellFull!4403 v!373)) (size!11257 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181890 () ListLongMap!5221)

(assert (=> b!386673 (= lt!181890 (getCurrentListMapNoExtraKeys!901 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386674 () Bool)

(declare-fun res!220817 () Bool)

(assert (=> b!386674 (=> (not res!220817) (not e!234523))))

(assert (=> b!386674 (= res!220817 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11256 _keys!658))))))

(declare-fun b!386675 () Bool)

(declare-fun res!220822 () Bool)

(assert (=> b!386675 (=> (not res!220822) (not e!234523))))

(assert (=> b!386675 (= res!220822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386676 () Bool)

(assert (=> b!386676 (= e!234526 (and e!234524 mapRes!15804))))

(declare-fun condMapEmpty!15804 () Bool)

(declare-fun mapDefault!15804 () ValueCell!4403)

(assert (=> b!386676 (= condMapEmpty!15804 (= (arr!10905 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4403)) mapDefault!15804)))))

(declare-fun b!386677 () Bool)

(declare-fun res!220820 () Bool)

(assert (=> b!386677 (=> (not res!220820) (not e!234525))))

(assert (=> b!386677 (= res!220820 (arrayNoDuplicates!0 lt!181889 #b00000000000000000000000000000000 Nil!6151))))

(assert (= (and start!37704 res!220814) b!386666))

(assert (= (and b!386666 res!220818) b!386675))

(assert (= (and b!386675 res!220822) b!386669))

(assert (= (and b!386669 res!220823) b!386674))

(assert (= (and b!386674 res!220817) b!386668))

(assert (= (and b!386668 res!220821) b!386667))

(assert (= (and b!386667 res!220819) b!386665))

(assert (= (and b!386665 res!220815) b!386671))

(assert (= (and b!386671 res!220816) b!386677))

(assert (= (and b!386677 res!220820) b!386673))

(assert (= (and b!386676 condMapEmpty!15804) mapIsEmpty!15804))

(assert (= (and b!386676 (not condMapEmpty!15804)) mapNonEmpty!15804))

(get-info :version)

(assert (= (and mapNonEmpty!15804 ((_ is ValueCellFull!4403) mapValue!15804)) b!386672))

(assert (= (and b!386676 ((_ is ValueCellFull!4403) mapDefault!15804)) b!386670))

(assert (= start!37704 b!386676))

(declare-fun m!383225 () Bool)

(assert (=> b!386668 m!383225))

(declare-fun m!383227 () Bool)

(assert (=> b!386667 m!383227))

(declare-fun m!383229 () Bool)

(assert (=> mapNonEmpty!15804 m!383229))

(declare-fun m!383231 () Bool)

(assert (=> b!386665 m!383231))

(declare-fun m!383233 () Bool)

(assert (=> b!386671 m!383233))

(declare-fun m!383235 () Bool)

(assert (=> b!386671 m!383235))

(declare-fun m!383237 () Bool)

(assert (=> b!386677 m!383237))

(declare-fun m!383239 () Bool)

(assert (=> start!37704 m!383239))

(declare-fun m!383241 () Bool)

(assert (=> start!37704 m!383241))

(declare-fun m!383243 () Bool)

(assert (=> start!37704 m!383243))

(declare-fun m!383245 () Bool)

(assert (=> b!386675 m!383245))

(declare-fun m!383247 () Bool)

(assert (=> b!386673 m!383247))

(declare-fun m!383249 () Bool)

(assert (=> b!386673 m!383249))

(declare-fun m!383251 () Bool)

(assert (=> b!386673 m!383251))

(declare-fun m!383253 () Bool)

(assert (=> b!386669 m!383253))

(check-sat (not b!386675) (not b!386673) (not b!386665) (not b_next!8821) (not b!386677) (not mapNonEmpty!15804) tp_is_empty!9493 (not b!386668) (not b!386669) (not start!37704) (not b!386671) b_and!16077)
(check-sat b_and!16077 (not b_next!8821))
