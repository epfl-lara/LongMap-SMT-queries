; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37662 () Bool)

(assert start!37662)

(declare-fun b_free!8779 () Bool)

(declare-fun b_next!8779 () Bool)

(assert (=> start!37662 (= b_free!8779 (not b_next!8779))))

(declare-fun tp!31089 () Bool)

(declare-fun b_and!16035 () Bool)

(assert (=> start!37662 (= tp!31089 b_and!16035)))

(declare-fun b!385846 () Bool)

(declare-fun e!234150 () Bool)

(declare-datatypes ((array!22790 0))(
  ( (array!22791 (arr!10863 (Array (_ BitVec 32) (_ BitVec 64))) (size!11215 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22790)

(assert (=> b!385846 (= e!234150 (bvsgt #b00000000000000000000000000000000 (size!11215 _keys!658)))))

(declare-datatypes ((V!13707 0))(
  ( (V!13708 (val!4770 Int)) )
))
(declare-datatypes ((ValueCell!4382 0))(
  ( (ValueCellFull!4382 (v!6968 V!13707)) (EmptyCell!4382) )
))
(declare-datatypes ((array!22792 0))(
  ( (array!22793 (arr!10864 (Array (_ BitVec 32) ValueCell!4382)) (size!11216 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22792)

(declare-fun lt!181701 () array!22790)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6278 0))(
  ( (tuple2!6279 (_1!3150 (_ BitVec 64)) (_2!3150 V!13707)) )
))
(declare-datatypes ((List!6125 0))(
  ( (Nil!6122) (Cons!6121 (h!6977 tuple2!6278) (t!11267 List!6125)) )
))
(declare-datatypes ((ListLongMap!5193 0))(
  ( (ListLongMap!5194 (toList!2612 List!6125)) )
))
(declare-fun lt!181700 () ListLongMap!5193)

(declare-fun zeroValue!472 () V!13707)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13707)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13707)

(declare-fun getCurrentListMapNoExtraKeys!887 (array!22790 array!22792 (_ BitVec 32) (_ BitVec 32) V!13707 V!13707 (_ BitVec 32) Int) ListLongMap!5193)

(assert (=> b!385846 (= lt!181700 (getCurrentListMapNoExtraKeys!887 lt!181701 (array!22793 (store (arr!10864 _values!506) i!548 (ValueCellFull!4382 v!373)) (size!11216 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181702 () ListLongMap!5193)

(assert (=> b!385846 (= lt!181702 (getCurrentListMapNoExtraKeys!887 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385847 () Bool)

(declare-fun res!220190 () Bool)

(assert (=> b!385847 (=> (not res!220190) (not e!234150))))

(declare-datatypes ((List!6126 0))(
  ( (Nil!6123) (Cons!6122 (h!6978 (_ BitVec 64)) (t!11268 List!6126)) )
))
(declare-fun arrayNoDuplicates!0 (array!22790 (_ BitVec 32) List!6126) Bool)

(assert (=> b!385847 (= res!220190 (arrayNoDuplicates!0 lt!181701 #b00000000000000000000000000000000 Nil!6123))))

(declare-fun b!385848 () Bool)

(declare-fun res!220191 () Bool)

(declare-fun e!234147 () Bool)

(assert (=> b!385848 (=> (not res!220191) (not e!234147))))

(assert (=> b!385848 (= res!220191 (or (= (select (arr!10863 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10863 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385849 () Bool)

(declare-fun res!220186 () Bool)

(assert (=> b!385849 (=> (not res!220186) (not e!234147))))

(assert (=> b!385849 (= res!220186 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11215 _keys!658))))))

(declare-fun b!385850 () Bool)

(declare-fun res!220184 () Bool)

(assert (=> b!385850 (=> (not res!220184) (not e!234147))))

(assert (=> b!385850 (= res!220184 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6123))))

(declare-fun mapNonEmpty!15741 () Bool)

(declare-fun mapRes!15741 () Bool)

(declare-fun tp!31088 () Bool)

(declare-fun e!234145 () Bool)

(assert (=> mapNonEmpty!15741 (= mapRes!15741 (and tp!31088 e!234145))))

(declare-fun mapKey!15741 () (_ BitVec 32))

(declare-fun mapValue!15741 () ValueCell!4382)

(declare-fun mapRest!15741 () (Array (_ BitVec 32) ValueCell!4382))

(assert (=> mapNonEmpty!15741 (= (arr!10864 _values!506) (store mapRest!15741 mapKey!15741 mapValue!15741))))

(declare-fun b!385851 () Bool)

(declare-fun tp_is_empty!9451 () Bool)

(assert (=> b!385851 (= e!234145 tp_is_empty!9451)))

(declare-fun b!385852 () Bool)

(assert (=> b!385852 (= e!234147 e!234150)))

(declare-fun res!220187 () Bool)

(assert (=> b!385852 (=> (not res!220187) (not e!234150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22790 (_ BitVec 32)) Bool)

(assert (=> b!385852 (= res!220187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181701 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!385852 (= lt!181701 (array!22791 (store (arr!10863 _keys!658) i!548 k0!778) (size!11215 _keys!658)))))

(declare-fun b!385853 () Bool)

(declare-fun res!220185 () Bool)

(assert (=> b!385853 (=> (not res!220185) (not e!234147))))

(assert (=> b!385853 (= res!220185 (and (= (size!11216 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11215 _keys!658) (size!11216 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15741 () Bool)

(assert (=> mapIsEmpty!15741 mapRes!15741))

(declare-fun b!385854 () Bool)

(declare-fun e!234149 () Bool)

(assert (=> b!385854 (= e!234149 tp_is_empty!9451)))

(declare-fun b!385855 () Bool)

(declare-fun res!220189 () Bool)

(assert (=> b!385855 (=> (not res!220189) (not e!234147))))

(declare-fun arrayContainsKey!0 (array!22790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385855 (= res!220189 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385856 () Bool)

(declare-fun res!220192 () Bool)

(assert (=> b!385856 (=> (not res!220192) (not e!234147))))

(assert (=> b!385856 (= res!220192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!220188 () Bool)

(assert (=> start!37662 (=> (not res!220188) (not e!234147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37662 (= res!220188 (validMask!0 mask!970))))

(assert (=> start!37662 e!234147))

(declare-fun e!234148 () Bool)

(declare-fun array_inv!8030 (array!22792) Bool)

(assert (=> start!37662 (and (array_inv!8030 _values!506) e!234148)))

(assert (=> start!37662 tp!31089))

(assert (=> start!37662 true))

(assert (=> start!37662 tp_is_empty!9451))

(declare-fun array_inv!8031 (array!22790) Bool)

(assert (=> start!37662 (array_inv!8031 _keys!658)))

(declare-fun b!385857 () Bool)

(assert (=> b!385857 (= e!234148 (and e!234149 mapRes!15741))))

(declare-fun condMapEmpty!15741 () Bool)

(declare-fun mapDefault!15741 () ValueCell!4382)

(assert (=> b!385857 (= condMapEmpty!15741 (= (arr!10864 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4382)) mapDefault!15741)))))

(declare-fun b!385858 () Bool)

(declare-fun res!220193 () Bool)

(assert (=> b!385858 (=> (not res!220193) (not e!234147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385858 (= res!220193 (validKeyInArray!0 k0!778))))

(assert (= (and start!37662 res!220188) b!385853))

(assert (= (and b!385853 res!220185) b!385856))

(assert (= (and b!385856 res!220192) b!385850))

(assert (= (and b!385850 res!220184) b!385849))

(assert (= (and b!385849 res!220186) b!385858))

(assert (= (and b!385858 res!220193) b!385848))

(assert (= (and b!385848 res!220191) b!385855))

(assert (= (and b!385855 res!220189) b!385852))

(assert (= (and b!385852 res!220187) b!385847))

(assert (= (and b!385847 res!220190) b!385846))

(assert (= (and b!385857 condMapEmpty!15741) mapIsEmpty!15741))

(assert (= (and b!385857 (not condMapEmpty!15741)) mapNonEmpty!15741))

(get-info :version)

(assert (= (and mapNonEmpty!15741 ((_ is ValueCellFull!4382) mapValue!15741)) b!385851))

(assert (= (and b!385857 ((_ is ValueCellFull!4382) mapDefault!15741)) b!385854))

(assert (= start!37662 b!385857))

(declare-fun m!382595 () Bool)

(assert (=> start!37662 m!382595))

(declare-fun m!382597 () Bool)

(assert (=> start!37662 m!382597))

(declare-fun m!382599 () Bool)

(assert (=> start!37662 m!382599))

(declare-fun m!382601 () Bool)

(assert (=> b!385847 m!382601))

(declare-fun m!382603 () Bool)

(assert (=> b!385848 m!382603))

(declare-fun m!382605 () Bool)

(assert (=> b!385850 m!382605))

(declare-fun m!382607 () Bool)

(assert (=> b!385852 m!382607))

(declare-fun m!382609 () Bool)

(assert (=> b!385852 m!382609))

(declare-fun m!382611 () Bool)

(assert (=> mapNonEmpty!15741 m!382611))

(declare-fun m!382613 () Bool)

(assert (=> b!385856 m!382613))

(declare-fun m!382615 () Bool)

(assert (=> b!385858 m!382615))

(declare-fun m!382617 () Bool)

(assert (=> b!385846 m!382617))

(declare-fun m!382619 () Bool)

(assert (=> b!385846 m!382619))

(declare-fun m!382621 () Bool)

(assert (=> b!385846 m!382621))

(declare-fun m!382623 () Bool)

(assert (=> b!385855 m!382623))

(check-sat (not b!385847) b_and!16035 (not b!385858) (not b!385855) (not b!385850) (not b!385852) (not b_next!8779) (not start!37662) (not b!385846) (not mapNonEmpty!15741) tp_is_empty!9451 (not b!385856))
(check-sat b_and!16035 (not b_next!8779))
