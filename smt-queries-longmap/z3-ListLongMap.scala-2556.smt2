; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39140 () Bool)

(assert start!39140)

(declare-fun b_free!9421 () Bool)

(declare-fun b_next!9421 () Bool)

(assert (=> start!39140 (= b_free!9421 (not b_next!9421))))

(declare-fun tp!33791 () Bool)

(declare-fun b_and!16821 () Bool)

(assert (=> start!39140 (= tp!33791 b_and!16821)))

(declare-fun res!239197 () Bool)

(declare-fun e!246631 () Bool)

(assert (=> start!39140 (=> (not res!239197) (not e!246631))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25008 0))(
  ( (array!25009 (arr!11953 (Array (_ BitVec 32) (_ BitVec 64))) (size!12305 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25008)

(assert (=> start!39140 (= res!239197 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12305 _keys!709))))))

(assert (=> start!39140 e!246631))

(declare-fun tp_is_empty!10573 () Bool)

(assert (=> start!39140 tp_is_empty!10573))

(assert (=> start!39140 tp!33791))

(assert (=> start!39140 true))

(declare-datatypes ((V!15203 0))(
  ( (V!15204 (val!5331 Int)) )
))
(declare-datatypes ((ValueCell!4943 0))(
  ( (ValueCellFull!4943 (v!7579 V!15203)) (EmptyCell!4943) )
))
(declare-datatypes ((array!25010 0))(
  ( (array!25011 (arr!11954 (Array (_ BitVec 32) ValueCell!4943)) (size!12306 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25010)

(declare-fun e!246629 () Bool)

(declare-fun array_inv!8798 (array!25010) Bool)

(assert (=> start!39140 (and (array_inv!8798 _values!549) e!246629)))

(declare-fun array_inv!8799 (array!25008) Bool)

(assert (=> start!39140 (array_inv!8799 _keys!709)))

(declare-fun b!412028 () Bool)

(declare-fun res!239201 () Bool)

(assert (=> b!412028 (=> (not res!239201) (not e!246631))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412028 (= res!239201 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12305 _keys!709))))))

(declare-fun b!412029 () Bool)

(declare-fun res!239199 () Bool)

(declare-fun e!246633 () Bool)

(assert (=> b!412029 (=> (not res!239199) (not e!246633))))

(assert (=> b!412029 (= res!239199 (bvsle from!863 i!563))))

(declare-fun b!412030 () Bool)

(declare-fun res!239208 () Bool)

(assert (=> b!412030 (=> (not res!239208) (not e!246631))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412030 (= res!239208 (validKeyInArray!0 k0!794))))

(declare-fun b!412031 () Bool)

(assert (=> b!412031 (= e!246631 e!246633)))

(declare-fun res!239203 () Bool)

(assert (=> b!412031 (=> (not res!239203) (not e!246633))))

(declare-fun lt!189427 () array!25008)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25008 (_ BitVec 32)) Bool)

(assert (=> b!412031 (= res!239203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189427 mask!1025))))

(assert (=> b!412031 (= lt!189427 (array!25009 (store (arr!11953 _keys!709) i!563 k0!794) (size!12305 _keys!709)))))

(declare-fun b!412032 () Bool)

(declare-fun res!239198 () Bool)

(assert (=> b!412032 (=> (not res!239198) (not e!246631))))

(declare-fun arrayContainsKey!0 (array!25008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412032 (= res!239198 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412033 () Bool)

(declare-fun e!246630 () Bool)

(declare-fun mapRes!17481 () Bool)

(assert (=> b!412033 (= e!246629 (and e!246630 mapRes!17481))))

(declare-fun condMapEmpty!17481 () Bool)

(declare-fun mapDefault!17481 () ValueCell!4943)

(assert (=> b!412033 (= condMapEmpty!17481 (= (arr!11954 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4943)) mapDefault!17481)))))

(declare-fun b!412034 () Bool)

(declare-fun e!246634 () Bool)

(assert (=> b!412034 (= e!246634 tp_is_empty!10573)))

(declare-fun b!412035 () Bool)

(declare-fun res!239200 () Bool)

(assert (=> b!412035 (=> (not res!239200) (not e!246631))))

(assert (=> b!412035 (= res!239200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412036 () Bool)

(declare-fun res!239207 () Bool)

(assert (=> b!412036 (=> (not res!239207) (not e!246631))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!412036 (= res!239207 (and (= (size!12306 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12305 _keys!709) (size!12306 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412037 () Bool)

(declare-fun res!239202 () Bool)

(assert (=> b!412037 (=> (not res!239202) (not e!246633))))

(declare-datatypes ((List!6808 0))(
  ( (Nil!6805) (Cons!6804 (h!7660 (_ BitVec 64)) (t!11974 List!6808)) )
))
(declare-fun arrayNoDuplicates!0 (array!25008 (_ BitVec 32) List!6808) Bool)

(assert (=> b!412037 (= res!239202 (arrayNoDuplicates!0 lt!189427 #b00000000000000000000000000000000 Nil!6805))))

(declare-fun b!412038 () Bool)

(assert (=> b!412038 (= e!246633 false)))

(declare-fun minValue!515 () V!15203)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15203)

(declare-datatypes ((tuple2!6790 0))(
  ( (tuple2!6791 (_1!3406 (_ BitVec 64)) (_2!3406 V!15203)) )
))
(declare-datatypes ((List!6809 0))(
  ( (Nil!6806) (Cons!6805 (h!7661 tuple2!6790) (t!11975 List!6809)) )
))
(declare-datatypes ((ListLongMap!5705 0))(
  ( (ListLongMap!5706 (toList!2868 List!6809)) )
))
(declare-fun lt!189429 () ListLongMap!5705)

(declare-fun v!412 () V!15203)

(declare-fun getCurrentListMapNoExtraKeys!1120 (array!25008 array!25010 (_ BitVec 32) (_ BitVec 32) V!15203 V!15203 (_ BitVec 32) Int) ListLongMap!5705)

(assert (=> b!412038 (= lt!189429 (getCurrentListMapNoExtraKeys!1120 lt!189427 (array!25011 (store (arr!11954 _values!549) i!563 (ValueCellFull!4943 v!412)) (size!12306 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189428 () ListLongMap!5705)

(assert (=> b!412038 (= lt!189428 (getCurrentListMapNoExtraKeys!1120 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412039 () Bool)

(declare-fun res!239205 () Bool)

(assert (=> b!412039 (=> (not res!239205) (not e!246631))))

(assert (=> b!412039 (= res!239205 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6805))))

(declare-fun mapNonEmpty!17481 () Bool)

(declare-fun tp!33792 () Bool)

(assert (=> mapNonEmpty!17481 (= mapRes!17481 (and tp!33792 e!246634))))

(declare-fun mapKey!17481 () (_ BitVec 32))

(declare-fun mapRest!17481 () (Array (_ BitVec 32) ValueCell!4943))

(declare-fun mapValue!17481 () ValueCell!4943)

(assert (=> mapNonEmpty!17481 (= (arr!11954 _values!549) (store mapRest!17481 mapKey!17481 mapValue!17481))))

(declare-fun b!412040 () Bool)

(declare-fun res!239204 () Bool)

(assert (=> b!412040 (=> (not res!239204) (not e!246631))))

(assert (=> b!412040 (= res!239204 (or (= (select (arr!11953 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11953 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17481 () Bool)

(assert (=> mapIsEmpty!17481 mapRes!17481))

(declare-fun b!412041 () Bool)

(declare-fun res!239206 () Bool)

(assert (=> b!412041 (=> (not res!239206) (not e!246631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412041 (= res!239206 (validMask!0 mask!1025))))

(declare-fun b!412042 () Bool)

(assert (=> b!412042 (= e!246630 tp_is_empty!10573)))

(assert (= (and start!39140 res!239197) b!412041))

(assert (= (and b!412041 res!239206) b!412036))

(assert (= (and b!412036 res!239207) b!412035))

(assert (= (and b!412035 res!239200) b!412039))

(assert (= (and b!412039 res!239205) b!412028))

(assert (= (and b!412028 res!239201) b!412030))

(assert (= (and b!412030 res!239208) b!412040))

(assert (= (and b!412040 res!239204) b!412032))

(assert (= (and b!412032 res!239198) b!412031))

(assert (= (and b!412031 res!239203) b!412037))

(assert (= (and b!412037 res!239202) b!412029))

(assert (= (and b!412029 res!239199) b!412038))

(assert (= (and b!412033 condMapEmpty!17481) mapIsEmpty!17481))

(assert (= (and b!412033 (not condMapEmpty!17481)) mapNonEmpty!17481))

(get-info :version)

(assert (= (and mapNonEmpty!17481 ((_ is ValueCellFull!4943) mapValue!17481)) b!412034))

(assert (= (and b!412033 ((_ is ValueCellFull!4943) mapDefault!17481)) b!412042))

(assert (= start!39140 b!412033))

(declare-fun m!402243 () Bool)

(assert (=> mapNonEmpty!17481 m!402243))

(declare-fun m!402245 () Bool)

(assert (=> b!412035 m!402245))

(declare-fun m!402247 () Bool)

(assert (=> b!412039 m!402247))

(declare-fun m!402249 () Bool)

(assert (=> b!412038 m!402249))

(declare-fun m!402251 () Bool)

(assert (=> b!412038 m!402251))

(declare-fun m!402253 () Bool)

(assert (=> b!412038 m!402253))

(declare-fun m!402255 () Bool)

(assert (=> b!412041 m!402255))

(declare-fun m!402257 () Bool)

(assert (=> b!412040 m!402257))

(declare-fun m!402259 () Bool)

(assert (=> b!412037 m!402259))

(declare-fun m!402261 () Bool)

(assert (=> b!412031 m!402261))

(declare-fun m!402263 () Bool)

(assert (=> b!412031 m!402263))

(declare-fun m!402265 () Bool)

(assert (=> b!412032 m!402265))

(declare-fun m!402267 () Bool)

(assert (=> b!412030 m!402267))

(declare-fun m!402269 () Bool)

(assert (=> start!39140 m!402269))

(declare-fun m!402271 () Bool)

(assert (=> start!39140 m!402271))

(check-sat (not mapNonEmpty!17481) b_and!16821 (not b!412031) tp_is_empty!10573 (not b!412041) (not b!412032) (not b!412035) (not b!412038) (not b!412039) (not start!39140) (not b!412030) (not b!412037) (not b_next!9421))
(check-sat b_and!16821 (not b_next!9421))
