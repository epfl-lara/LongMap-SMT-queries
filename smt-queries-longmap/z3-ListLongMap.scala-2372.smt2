; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37680 () Bool)

(assert start!37680)

(declare-fun b_free!8797 () Bool)

(declare-fun b_next!8797 () Bool)

(assert (=> start!37680 (= b_free!8797 (not b_next!8797))))

(declare-fun tp!31143 () Bool)

(declare-fun b_and!16013 () Bool)

(assert (=> start!37680 (= tp!31143 b_and!16013)))

(declare-fun b!385975 () Bool)

(declare-fun e!234168 () Bool)

(declare-fun e!234167 () Bool)

(declare-fun mapRes!15768 () Bool)

(assert (=> b!385975 (= e!234168 (and e!234167 mapRes!15768))))

(declare-fun condMapEmpty!15768 () Bool)

(declare-datatypes ((V!13731 0))(
  ( (V!13732 (val!4779 Int)) )
))
(declare-datatypes ((ValueCell!4391 0))(
  ( (ValueCellFull!4391 (v!6970 V!13731)) (EmptyCell!4391) )
))
(declare-datatypes ((array!22821 0))(
  ( (array!22822 (arr!10879 (Array (_ BitVec 32) ValueCell!4391)) (size!11232 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22821)

(declare-fun mapDefault!15768 () ValueCell!4391)

(assert (=> b!385975 (= condMapEmpty!15768 (= (arr!10879 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4391)) mapDefault!15768)))))

(declare-fun b!385976 () Bool)

(declare-fun tp_is_empty!9469 () Bool)

(assert (=> b!385976 (= e!234167 tp_is_empty!9469)))

(declare-fun b!385977 () Bool)

(declare-fun res!220337 () Bool)

(declare-fun e!234169 () Bool)

(assert (=> b!385977 (=> (not res!220337) (not e!234169))))

(declare-datatypes ((array!22823 0))(
  ( (array!22824 (arr!10880 (Array (_ BitVec 32) (_ BitVec 64))) (size!11233 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22823)

(declare-datatypes ((List!6241 0))(
  ( (Nil!6238) (Cons!6237 (h!7093 (_ BitVec 64)) (t!11382 List!6241)) )
))
(declare-fun arrayNoDuplicates!0 (array!22823 (_ BitVec 32) List!6241) Bool)

(assert (=> b!385977 (= res!220337 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6238))))

(declare-fun b!385978 () Bool)

(declare-fun res!220334 () Bool)

(assert (=> b!385978 (=> (not res!220334) (not e!234169))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385978 (= res!220334 (validKeyInArray!0 k0!778))))

(declare-fun b!385979 () Bool)

(declare-fun e!234170 () Bool)

(assert (=> b!385979 (= e!234169 e!234170)))

(declare-fun res!220328 () Bool)

(assert (=> b!385979 (=> (not res!220328) (not e!234170))))

(declare-fun lt!181529 () array!22823)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22823 (_ BitVec 32)) Bool)

(assert (=> b!385979 (= res!220328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181529 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385979 (= lt!181529 (array!22824 (store (arr!10880 _keys!658) i!548 k0!778) (size!11233 _keys!658)))))

(declare-fun b!385980 () Bool)

(declare-fun e!234165 () Bool)

(assert (=> b!385980 (= e!234165 tp_is_empty!9469)))

(declare-fun b!385981 () Bool)

(declare-fun res!220332 () Bool)

(assert (=> b!385981 (=> (not res!220332) (not e!234169))))

(assert (=> b!385981 (= res!220332 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11233 _keys!658))))))

(declare-fun res!220336 () Bool)

(assert (=> start!37680 (=> (not res!220336) (not e!234169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37680 (= res!220336 (validMask!0 mask!970))))

(assert (=> start!37680 e!234169))

(declare-fun array_inv!8004 (array!22821) Bool)

(assert (=> start!37680 (and (array_inv!8004 _values!506) e!234168)))

(assert (=> start!37680 tp!31143))

(assert (=> start!37680 true))

(assert (=> start!37680 tp_is_empty!9469))

(declare-fun array_inv!8005 (array!22823) Bool)

(assert (=> start!37680 (array_inv!8005 _keys!658)))

(declare-fun b!385982 () Bool)

(declare-fun res!220333 () Bool)

(assert (=> b!385982 (=> (not res!220333) (not e!234169))))

(assert (=> b!385982 (= res!220333 (or (= (select (arr!10880 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10880 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15768 () Bool)

(declare-fun tp!31142 () Bool)

(assert (=> mapNonEmpty!15768 (= mapRes!15768 (and tp!31142 e!234165))))

(declare-fun mapKey!15768 () (_ BitVec 32))

(declare-fun mapRest!15768 () (Array (_ BitVec 32) ValueCell!4391))

(declare-fun mapValue!15768 () ValueCell!4391)

(assert (=> mapNonEmpty!15768 (= (arr!10879 _values!506) (store mapRest!15768 mapKey!15768 mapValue!15768))))

(declare-fun b!385983 () Bool)

(declare-fun res!220329 () Bool)

(assert (=> b!385983 (=> (not res!220329) (not e!234169))))

(assert (=> b!385983 (= res!220329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385984 () Bool)

(declare-fun res!220330 () Bool)

(assert (=> b!385984 (=> (not res!220330) (not e!234169))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385984 (= res!220330 (and (= (size!11232 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11233 _keys!658) (size!11232 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385985 () Bool)

(declare-fun res!220335 () Bool)

(assert (=> b!385985 (=> (not res!220335) (not e!234170))))

(assert (=> b!385985 (= res!220335 (arrayNoDuplicates!0 lt!181529 #b00000000000000000000000000000000 Nil!6238))))

(declare-fun b!385986 () Bool)

(declare-fun res!220331 () Bool)

(assert (=> b!385986 (=> (not res!220331) (not e!234169))))

(declare-fun arrayContainsKey!0 (array!22823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385986 (= res!220331 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15768 () Bool)

(assert (=> mapIsEmpty!15768 mapRes!15768))

(declare-fun b!385987 () Bool)

(assert (=> b!385987 (= e!234170 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13731)

(declare-fun v!373 () V!13731)

(declare-datatypes ((tuple2!6410 0))(
  ( (tuple2!6411 (_1!3216 (_ BitVec 64)) (_2!3216 V!13731)) )
))
(declare-datatypes ((List!6242 0))(
  ( (Nil!6239) (Cons!6238 (h!7094 tuple2!6410) (t!11383 List!6242)) )
))
(declare-datatypes ((ListLongMap!5313 0))(
  ( (ListLongMap!5314 (toList!2672 List!6242)) )
))
(declare-fun lt!181528 () ListLongMap!5313)

(declare-fun minValue!472 () V!13731)

(declare-fun getCurrentListMapNoExtraKeys!912 (array!22823 array!22821 (_ BitVec 32) (_ BitVec 32) V!13731 V!13731 (_ BitVec 32) Int) ListLongMap!5313)

(assert (=> b!385987 (= lt!181528 (getCurrentListMapNoExtraKeys!912 lt!181529 (array!22822 (store (arr!10879 _values!506) i!548 (ValueCellFull!4391 v!373)) (size!11232 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181530 () ListLongMap!5313)

(assert (=> b!385987 (= lt!181530 (getCurrentListMapNoExtraKeys!912 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37680 res!220336) b!385984))

(assert (= (and b!385984 res!220330) b!385983))

(assert (= (and b!385983 res!220329) b!385977))

(assert (= (and b!385977 res!220337) b!385981))

(assert (= (and b!385981 res!220332) b!385978))

(assert (= (and b!385978 res!220334) b!385982))

(assert (= (and b!385982 res!220333) b!385986))

(assert (= (and b!385986 res!220331) b!385979))

(assert (= (and b!385979 res!220328) b!385985))

(assert (= (and b!385985 res!220335) b!385987))

(assert (= (and b!385975 condMapEmpty!15768) mapIsEmpty!15768))

(assert (= (and b!385975 (not condMapEmpty!15768)) mapNonEmpty!15768))

(get-info :version)

(assert (= (and mapNonEmpty!15768 ((_ is ValueCellFull!4391) mapValue!15768)) b!385980))

(assert (= (and b!385975 ((_ is ValueCellFull!4391) mapDefault!15768)) b!385976))

(assert (= start!37680 b!385975))

(declare-fun m!381911 () Bool)

(assert (=> b!385982 m!381911))

(declare-fun m!381913 () Bool)

(assert (=> b!385977 m!381913))

(declare-fun m!381915 () Bool)

(assert (=> b!385985 m!381915))

(declare-fun m!381917 () Bool)

(assert (=> b!385979 m!381917))

(declare-fun m!381919 () Bool)

(assert (=> b!385979 m!381919))

(declare-fun m!381921 () Bool)

(assert (=> b!385986 m!381921))

(declare-fun m!381923 () Bool)

(assert (=> b!385978 m!381923))

(declare-fun m!381925 () Bool)

(assert (=> b!385983 m!381925))

(declare-fun m!381927 () Bool)

(assert (=> mapNonEmpty!15768 m!381927))

(declare-fun m!381929 () Bool)

(assert (=> b!385987 m!381929))

(declare-fun m!381931 () Bool)

(assert (=> b!385987 m!381931))

(declare-fun m!381933 () Bool)

(assert (=> b!385987 m!381933))

(declare-fun m!381935 () Bool)

(assert (=> start!37680 m!381935))

(declare-fun m!381937 () Bool)

(assert (=> start!37680 m!381937))

(declare-fun m!381939 () Bool)

(assert (=> start!37680 m!381939))

(check-sat (not b!385983) (not b!385978) (not start!37680) b_and!16013 (not b!385979) (not mapNonEmpty!15768) (not b!385986) (not b!385985) (not b!385987) tp_is_empty!9469 (not b_next!8797) (not b!385977))
(check-sat b_and!16013 (not b_next!8797))
