; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36880 () Bool)

(assert start!36880)

(declare-fun b_free!8007 () Bool)

(declare-fun b_next!8007 () Bool)

(assert (=> start!36880 (= b_free!8007 (not b_next!8007))))

(declare-fun tp!28737 () Bool)

(declare-fun b_and!15249 () Bool)

(assert (=> start!36880 (= tp!28737 b_and!15249)))

(declare-fun b!369176 () Bool)

(declare-fun res!207055 () Bool)

(declare-fun e!225672 () Bool)

(assert (=> b!369176 (=> (not res!207055) (not e!225672))))

(declare-datatypes ((array!21261 0))(
  ( (array!21262 (arr!10099 (Array (_ BitVec 32) (_ BitVec 64))) (size!10451 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21261)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369176 (= res!207055 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14547 () Bool)

(declare-fun mapRes!14547 () Bool)

(assert (=> mapIsEmpty!14547 mapRes!14547))

(declare-fun b!369177 () Bool)

(declare-fun res!207057 () Bool)

(assert (=> b!369177 (=> (not res!207057) (not e!225672))))

(declare-datatypes ((V!12645 0))(
  ( (V!12646 (val!4372 Int)) )
))
(declare-datatypes ((ValueCell!3984 0))(
  ( (ValueCellFull!3984 (v!6569 V!12645)) (EmptyCell!3984) )
))
(declare-datatypes ((array!21263 0))(
  ( (array!21264 (arr!10100 (Array (_ BitVec 32) ValueCell!3984)) (size!10452 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21263)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369177 (= res!207057 (and (= (size!10452 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10451 _keys!658) (size!10452 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369178 () Bool)

(declare-fun e!225677 () Bool)

(declare-fun tp_is_empty!8655 () Bool)

(assert (=> b!369178 (= e!225677 tp_is_empty!8655)))

(declare-fun b!369179 () Bool)

(declare-fun res!207051 () Bool)

(assert (=> b!369179 (=> (not res!207051) (not e!225672))))

(declare-datatypes ((List!5630 0))(
  ( (Nil!5627) (Cons!5626 (h!6482 (_ BitVec 64)) (t!10780 List!5630)) )
))
(declare-fun arrayNoDuplicates!0 (array!21261 (_ BitVec 32) List!5630) Bool)

(assert (=> b!369179 (= res!207051 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5627))))

(declare-fun b!369180 () Bool)

(declare-fun e!225675 () Bool)

(declare-fun e!225673 () Bool)

(assert (=> b!369180 (= e!225675 (and e!225673 mapRes!14547))))

(declare-fun condMapEmpty!14547 () Bool)

(declare-fun mapDefault!14547 () ValueCell!3984)

(assert (=> b!369180 (= condMapEmpty!14547 (= (arr!10100 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3984)) mapDefault!14547)))))

(declare-fun b!369181 () Bool)

(declare-fun res!207056 () Bool)

(assert (=> b!369181 (=> (not res!207056) (not e!225672))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369181 (= res!207056 (or (= (select (arr!10099 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10099 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!207053 () Bool)

(assert (=> start!36880 (=> (not res!207053) (not e!225672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36880 (= res!207053 (validMask!0 mask!970))))

(assert (=> start!36880 e!225672))

(declare-fun array_inv!7464 (array!21263) Bool)

(assert (=> start!36880 (and (array_inv!7464 _values!506) e!225675)))

(assert (=> start!36880 tp!28737))

(assert (=> start!36880 true))

(assert (=> start!36880 tp_is_empty!8655))

(declare-fun array_inv!7465 (array!21261) Bool)

(assert (=> start!36880 (array_inv!7465 _keys!658)))

(declare-fun b!369182 () Bool)

(declare-fun e!225676 () Bool)

(assert (=> b!369182 (= e!225672 e!225676)))

(declare-fun res!207054 () Bool)

(assert (=> b!369182 (=> (not res!207054) (not e!225676))))

(declare-fun lt!169677 () array!21261)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21261 (_ BitVec 32)) Bool)

(assert (=> b!369182 (= res!207054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169677 mask!970))))

(assert (=> b!369182 (= lt!169677 (array!21262 (store (arr!10099 _keys!658) i!548 k0!778) (size!10451 _keys!658)))))

(declare-fun b!369183 () Bool)

(declare-fun res!207052 () Bool)

(assert (=> b!369183 (=> (not res!207052) (not e!225672))))

(assert (=> b!369183 (= res!207052 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10451 _keys!658))))))

(declare-fun b!369184 () Bool)

(assert (=> b!369184 (= e!225673 tp_is_empty!8655)))

(declare-fun b!369185 () Bool)

(assert (=> b!369185 (= e!225676 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5796 0))(
  ( (tuple2!5797 (_1!2909 (_ BitVec 64)) (_2!2909 V!12645)) )
))
(declare-datatypes ((List!5631 0))(
  ( (Nil!5628) (Cons!5627 (h!6483 tuple2!5796) (t!10781 List!5631)) )
))
(declare-datatypes ((ListLongMap!4709 0))(
  ( (ListLongMap!4710 (toList!2370 List!5631)) )
))
(declare-fun lt!169675 () ListLongMap!4709)

(declare-fun zeroValue!472 () V!12645)

(declare-fun v!373 () V!12645)

(declare-fun minValue!472 () V!12645)

(declare-fun getCurrentListMapNoExtraKeys!647 (array!21261 array!21263 (_ BitVec 32) (_ BitVec 32) V!12645 V!12645 (_ BitVec 32) Int) ListLongMap!4709)

(assert (=> b!369185 (= lt!169675 (getCurrentListMapNoExtraKeys!647 lt!169677 (array!21264 (store (arr!10100 _values!506) i!548 (ValueCellFull!3984 v!373)) (size!10452 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169676 () ListLongMap!4709)

(assert (=> b!369185 (= lt!169676 (getCurrentListMapNoExtraKeys!647 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369186 () Bool)

(declare-fun res!207059 () Bool)

(assert (=> b!369186 (=> (not res!207059) (not e!225676))))

(assert (=> b!369186 (= res!207059 (arrayNoDuplicates!0 lt!169677 #b00000000000000000000000000000000 Nil!5627))))

(declare-fun b!369187 () Bool)

(declare-fun res!207050 () Bool)

(assert (=> b!369187 (=> (not res!207050) (not e!225672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369187 (= res!207050 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14547 () Bool)

(declare-fun tp!28736 () Bool)

(assert (=> mapNonEmpty!14547 (= mapRes!14547 (and tp!28736 e!225677))))

(declare-fun mapKey!14547 () (_ BitVec 32))

(declare-fun mapValue!14547 () ValueCell!3984)

(declare-fun mapRest!14547 () (Array (_ BitVec 32) ValueCell!3984))

(assert (=> mapNonEmpty!14547 (= (arr!10100 _values!506) (store mapRest!14547 mapKey!14547 mapValue!14547))))

(declare-fun b!369188 () Bool)

(declare-fun res!207058 () Bool)

(assert (=> b!369188 (=> (not res!207058) (not e!225672))))

(assert (=> b!369188 (= res!207058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36880 res!207053) b!369177))

(assert (= (and b!369177 res!207057) b!369188))

(assert (= (and b!369188 res!207058) b!369179))

(assert (= (and b!369179 res!207051) b!369183))

(assert (= (and b!369183 res!207052) b!369187))

(assert (= (and b!369187 res!207050) b!369181))

(assert (= (and b!369181 res!207056) b!369176))

(assert (= (and b!369176 res!207055) b!369182))

(assert (= (and b!369182 res!207054) b!369186))

(assert (= (and b!369186 res!207059) b!369185))

(assert (= (and b!369180 condMapEmpty!14547) mapIsEmpty!14547))

(assert (= (and b!369180 (not condMapEmpty!14547)) mapNonEmpty!14547))

(get-info :version)

(assert (= (and mapNonEmpty!14547 ((_ is ValueCellFull!3984) mapValue!14547)) b!369178))

(assert (= (and b!369180 ((_ is ValueCellFull!3984) mapDefault!14547)) b!369184))

(assert (= start!36880 b!369180))

(declare-fun m!365613 () Bool)

(assert (=> start!36880 m!365613))

(declare-fun m!365615 () Bool)

(assert (=> start!36880 m!365615))

(declare-fun m!365617 () Bool)

(assert (=> start!36880 m!365617))

(declare-fun m!365619 () Bool)

(assert (=> b!369185 m!365619))

(declare-fun m!365621 () Bool)

(assert (=> b!369185 m!365621))

(declare-fun m!365623 () Bool)

(assert (=> b!369185 m!365623))

(declare-fun m!365625 () Bool)

(assert (=> b!369182 m!365625))

(declare-fun m!365627 () Bool)

(assert (=> b!369182 m!365627))

(declare-fun m!365629 () Bool)

(assert (=> b!369188 m!365629))

(declare-fun m!365631 () Bool)

(assert (=> b!369179 m!365631))

(declare-fun m!365633 () Bool)

(assert (=> b!369181 m!365633))

(declare-fun m!365635 () Bool)

(assert (=> b!369176 m!365635))

(declare-fun m!365637 () Bool)

(assert (=> mapNonEmpty!14547 m!365637))

(declare-fun m!365639 () Bool)

(assert (=> b!369187 m!365639))

(declare-fun m!365641 () Bool)

(assert (=> b!369186 m!365641))

(check-sat (not b!369176) (not b!369187) (not mapNonEmpty!14547) b_and!15249 tp_is_empty!8655 (not b!369188) (not b!369179) (not b!369185) (not start!36880) (not b_next!8007) (not b!369186) (not b!369182))
(check-sat b_and!15249 (not b_next!8007))
