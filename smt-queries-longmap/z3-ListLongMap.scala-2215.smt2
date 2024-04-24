; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36738 () Bool)

(assert start!36738)

(declare-fun b!366701 () Bool)

(declare-fun res!205198 () Bool)

(declare-fun e!224493 () Bool)

(assert (=> b!366701 (=> (not res!205198) (not e!224493))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12475 0))(
  ( (V!12476 (val!4308 Int)) )
))
(declare-datatypes ((ValueCell!3920 0))(
  ( (ValueCellFull!3920 (v!6506 V!12475)) (EmptyCell!3920) )
))
(declare-datatypes ((array!21000 0))(
  ( (array!21001 (arr!9968 (Array (_ BitVec 32) ValueCell!3920)) (size!10320 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21000)

(declare-datatypes ((array!21002 0))(
  ( (array!21003 (arr!9969 (Array (_ BitVec 32) (_ BitVec 64))) (size!10321 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21002)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!366701 (= res!205198 (and (= (size!10320 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10321 _keys!658) (size!10320 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366702 () Bool)

(declare-fun res!205202 () Bool)

(assert (=> b!366702 (=> (not res!205202) (not e!224493))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366702 (= res!205202 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366703 () Bool)

(declare-fun res!205201 () Bool)

(assert (=> b!366703 (=> (not res!205201) (not e!224493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366703 (= res!205201 (validKeyInArray!0 k0!778))))

(declare-fun b!366704 () Bool)

(declare-fun res!205199 () Bool)

(assert (=> b!366704 (=> (not res!205199) (not e!224493))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366704 (= res!205199 (or (= (select (arr!9969 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9969 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14355 () Bool)

(declare-fun mapRes!14355 () Bool)

(assert (=> mapIsEmpty!14355 mapRes!14355))

(declare-fun b!366705 () Bool)

(declare-fun res!205200 () Bool)

(assert (=> b!366705 (=> (not res!205200) (not e!224493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21002 (_ BitVec 32)) Bool)

(assert (=> b!366705 (= res!205200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!205197 () Bool)

(assert (=> start!36738 (=> (not res!205197) (not e!224493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36738 (= res!205197 (validMask!0 mask!970))))

(assert (=> start!36738 e!224493))

(assert (=> start!36738 true))

(declare-fun e!224488 () Bool)

(declare-fun array_inv!7410 (array!21000) Bool)

(assert (=> start!36738 (and (array_inv!7410 _values!506) e!224488)))

(declare-fun array_inv!7411 (array!21002) Bool)

(assert (=> start!36738 (array_inv!7411 _keys!658)))

(declare-fun b!366706 () Bool)

(declare-fun e!224492 () Bool)

(declare-fun tp_is_empty!8527 () Bool)

(assert (=> b!366706 (= e!224492 tp_is_empty!8527)))

(declare-fun mapNonEmpty!14355 () Bool)

(declare-fun tp!28431 () Bool)

(assert (=> mapNonEmpty!14355 (= mapRes!14355 (and tp!28431 e!224492))))

(declare-fun mapRest!14355 () (Array (_ BitVec 32) ValueCell!3920))

(declare-fun mapKey!14355 () (_ BitVec 32))

(declare-fun mapValue!14355 () ValueCell!3920)

(assert (=> mapNonEmpty!14355 (= (arr!9968 _values!506) (store mapRest!14355 mapKey!14355 mapValue!14355))))

(declare-fun b!366707 () Bool)

(declare-fun e!224491 () Bool)

(assert (=> b!366707 (= e!224491 tp_is_empty!8527)))

(declare-fun b!366708 () Bool)

(assert (=> b!366708 (= e!224488 (and e!224491 mapRes!14355))))

(declare-fun condMapEmpty!14355 () Bool)

(declare-fun mapDefault!14355 () ValueCell!3920)

(assert (=> b!366708 (= condMapEmpty!14355 (= (arr!9968 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3920)) mapDefault!14355)))))

(declare-fun b!366709 () Bool)

(declare-fun res!205204 () Bool)

(assert (=> b!366709 (=> (not res!205204) (not e!224493))))

(assert (=> b!366709 (= res!205204 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10321 _keys!658))))))

(declare-fun b!366710 () Bool)

(declare-fun res!205205 () Bool)

(assert (=> b!366710 (=> (not res!205205) (not e!224493))))

(declare-datatypes ((List!5460 0))(
  ( (Nil!5457) (Cons!5456 (h!6312 (_ BitVec 64)) (t!10602 List!5460)) )
))
(declare-fun arrayNoDuplicates!0 (array!21002 (_ BitVec 32) List!5460) Bool)

(assert (=> b!366710 (= res!205205 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5457))))

(declare-fun b!366711 () Bool)

(declare-fun e!224489 () Bool)

(assert (=> b!366711 (= e!224489 false)))

(declare-fun lt!169287 () Bool)

(declare-fun lt!169288 () array!21002)

(assert (=> b!366711 (= lt!169287 (arrayNoDuplicates!0 lt!169288 #b00000000000000000000000000000000 Nil!5457))))

(declare-fun b!366712 () Bool)

(assert (=> b!366712 (= e!224493 e!224489)))

(declare-fun res!205203 () Bool)

(assert (=> b!366712 (=> (not res!205203) (not e!224489))))

(assert (=> b!366712 (= res!205203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169288 mask!970))))

(assert (=> b!366712 (= lt!169288 (array!21003 (store (arr!9969 _keys!658) i!548 k0!778) (size!10321 _keys!658)))))

(assert (= (and start!36738 res!205197) b!366701))

(assert (= (and b!366701 res!205198) b!366705))

(assert (= (and b!366705 res!205200) b!366710))

(assert (= (and b!366710 res!205205) b!366709))

(assert (= (and b!366709 res!205204) b!366703))

(assert (= (and b!366703 res!205201) b!366704))

(assert (= (and b!366704 res!205199) b!366702))

(assert (= (and b!366702 res!205202) b!366712))

(assert (= (and b!366712 res!205203) b!366711))

(assert (= (and b!366708 condMapEmpty!14355) mapIsEmpty!14355))

(assert (= (and b!366708 (not condMapEmpty!14355)) mapNonEmpty!14355))

(get-info :version)

(assert (= (and mapNonEmpty!14355 ((_ is ValueCellFull!3920) mapValue!14355)) b!366706))

(assert (= (and b!366708 ((_ is ValueCellFull!3920) mapDefault!14355)) b!366707))

(assert (= start!36738 b!366708))

(declare-fun m!364193 () Bool)

(assert (=> b!366705 m!364193))

(declare-fun m!364195 () Bool)

(assert (=> b!366704 m!364195))

(declare-fun m!364197 () Bool)

(assert (=> b!366712 m!364197))

(declare-fun m!364199 () Bool)

(assert (=> b!366712 m!364199))

(declare-fun m!364201 () Bool)

(assert (=> b!366711 m!364201))

(declare-fun m!364203 () Bool)

(assert (=> b!366702 m!364203))

(declare-fun m!364205 () Bool)

(assert (=> start!36738 m!364205))

(declare-fun m!364207 () Bool)

(assert (=> start!36738 m!364207))

(declare-fun m!364209 () Bool)

(assert (=> start!36738 m!364209))

(declare-fun m!364211 () Bool)

(assert (=> b!366703 m!364211))

(declare-fun m!364213 () Bool)

(assert (=> mapNonEmpty!14355 m!364213))

(declare-fun m!364215 () Bool)

(assert (=> b!366710 m!364215))

(check-sat (not mapNonEmpty!14355) (not b!366703) (not b!366712) (not start!36738) (not b!366705) (not b!366702) tp_is_empty!8527 (not b!366711) (not b!366710))
(check-sat)
