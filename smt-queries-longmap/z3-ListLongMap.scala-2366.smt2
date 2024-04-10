; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37660 () Bool)

(assert start!37660)

(declare-fun b!385591 () Bool)

(declare-fun res!219955 () Bool)

(declare-fun e!234040 () Bool)

(assert (=> b!385591 (=> (not res!219955) (not e!234040))))

(declare-datatypes ((array!22769 0))(
  ( (array!22770 (arr!10853 (Array (_ BitVec 32) (_ BitVec 64))) (size!11205 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22769)

(declare-datatypes ((List!6248 0))(
  ( (Nil!6245) (Cons!6244 (h!7100 (_ BitVec 64)) (t!11398 List!6248)) )
))
(declare-fun arrayNoDuplicates!0 (array!22769 (_ BitVec 32) List!6248) Bool)

(assert (=> b!385591 (= res!219955 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6245))))

(declare-fun b!385592 () Bool)

(declare-fun res!219962 () Bool)

(assert (=> b!385592 (=> (not res!219962) (not e!234040))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385592 (= res!219962 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385593 () Bool)

(declare-fun res!219957 () Bool)

(assert (=> b!385593 (=> (not res!219957) (not e!234040))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!13685 0))(
  ( (V!13686 (val!4762 Int)) )
))
(declare-datatypes ((ValueCell!4374 0))(
  ( (ValueCellFull!4374 (v!6959 V!13685)) (EmptyCell!4374) )
))
(declare-datatypes ((array!22771 0))(
  ( (array!22772 (arr!10854 (Array (_ BitVec 32) ValueCell!4374)) (size!11206 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22771)

(assert (=> b!385593 (= res!219957 (and (= (size!11206 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11205 _keys!658) (size!11206 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385594 () Bool)

(declare-fun res!219960 () Bool)

(assert (=> b!385594 (=> (not res!219960) (not e!234040))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385594 (= res!219960 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11205 _keys!658))))))

(declare-fun mapNonEmpty!15717 () Bool)

(declare-fun mapRes!15717 () Bool)

(declare-fun tp!31044 () Bool)

(declare-fun e!234039 () Bool)

(assert (=> mapNonEmpty!15717 (= mapRes!15717 (and tp!31044 e!234039))))

(declare-fun mapValue!15717 () ValueCell!4374)

(declare-fun mapRest!15717 () (Array (_ BitVec 32) ValueCell!4374))

(declare-fun mapKey!15717 () (_ BitVec 32))

(assert (=> mapNonEmpty!15717 (= (arr!10854 _values!506) (store mapRest!15717 mapKey!15717 mapValue!15717))))

(declare-fun b!385595 () Bool)

(declare-fun res!219958 () Bool)

(assert (=> b!385595 (=> (not res!219958) (not e!234040))))

(assert (=> b!385595 (= res!219958 (or (= (select (arr!10853 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10853 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!219956 () Bool)

(assert (=> start!37660 (=> (not res!219956) (not e!234040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37660 (= res!219956 (validMask!0 mask!970))))

(assert (=> start!37660 e!234040))

(assert (=> start!37660 true))

(declare-fun e!234037 () Bool)

(declare-fun array_inv!7990 (array!22771) Bool)

(assert (=> start!37660 (and (array_inv!7990 _values!506) e!234037)))

(declare-fun array_inv!7991 (array!22769) Bool)

(assert (=> start!37660 (array_inv!7991 _keys!658)))

(declare-fun b!385596 () Bool)

(declare-fun tp_is_empty!9435 () Bool)

(assert (=> b!385596 (= e!234039 tp_is_empty!9435)))

(declare-fun b!385597 () Bool)

(assert (=> b!385597 (= e!234040 false)))

(declare-fun lt!181635 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22769 (_ BitVec 32)) Bool)

(assert (=> b!385597 (= lt!181635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!22770 (store (arr!10853 _keys!658) i!548 k0!778) (size!11205 _keys!658)) mask!970))))

(declare-fun b!385598 () Bool)

(declare-fun res!219959 () Bool)

(assert (=> b!385598 (=> (not res!219959) (not e!234040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385598 (= res!219959 (validKeyInArray!0 k0!778))))

(declare-fun b!385599 () Bool)

(declare-fun res!219961 () Bool)

(assert (=> b!385599 (=> (not res!219961) (not e!234040))))

(assert (=> b!385599 (= res!219961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385600 () Bool)

(declare-fun e!234041 () Bool)

(assert (=> b!385600 (= e!234041 tp_is_empty!9435)))

(declare-fun b!385601 () Bool)

(assert (=> b!385601 (= e!234037 (and e!234041 mapRes!15717))))

(declare-fun condMapEmpty!15717 () Bool)

(declare-fun mapDefault!15717 () ValueCell!4374)

(assert (=> b!385601 (= condMapEmpty!15717 (= (arr!10854 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4374)) mapDefault!15717)))))

(declare-fun mapIsEmpty!15717 () Bool)

(assert (=> mapIsEmpty!15717 mapRes!15717))

(assert (= (and start!37660 res!219956) b!385593))

(assert (= (and b!385593 res!219957) b!385599))

(assert (= (and b!385599 res!219961) b!385591))

(assert (= (and b!385591 res!219955) b!385594))

(assert (= (and b!385594 res!219960) b!385598))

(assert (= (and b!385598 res!219959) b!385595))

(assert (= (and b!385595 res!219958) b!385592))

(assert (= (and b!385592 res!219962) b!385597))

(assert (= (and b!385601 condMapEmpty!15717) mapIsEmpty!15717))

(assert (= (and b!385601 (not condMapEmpty!15717)) mapNonEmpty!15717))

(get-info :version)

(assert (= (and mapNonEmpty!15717 ((_ is ValueCellFull!4374) mapValue!15717)) b!385596))

(assert (= (and b!385601 ((_ is ValueCellFull!4374) mapDefault!15717)) b!385600))

(assert (= start!37660 b!385601))

(declare-fun m!382165 () Bool)

(assert (=> b!385599 m!382165))

(declare-fun m!382167 () Bool)

(assert (=> b!385598 m!382167))

(declare-fun m!382169 () Bool)

(assert (=> start!37660 m!382169))

(declare-fun m!382171 () Bool)

(assert (=> start!37660 m!382171))

(declare-fun m!382173 () Bool)

(assert (=> start!37660 m!382173))

(declare-fun m!382175 () Bool)

(assert (=> b!385591 m!382175))

(declare-fun m!382177 () Bool)

(assert (=> mapNonEmpty!15717 m!382177))

(declare-fun m!382179 () Bool)

(assert (=> b!385592 m!382179))

(declare-fun m!382181 () Bool)

(assert (=> b!385595 m!382181))

(declare-fun m!382183 () Bool)

(assert (=> b!385597 m!382183))

(declare-fun m!382185 () Bool)

(assert (=> b!385597 m!382185))

(check-sat (not start!37660) (not b!385599) (not b!385592) (not b!385597) (not b!385591) (not mapNonEmpty!15717) (not b!385598) tp_is_empty!9435)
(check-sat)
