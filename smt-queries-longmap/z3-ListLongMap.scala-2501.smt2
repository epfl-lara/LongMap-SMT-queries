; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38810 () Bool)

(assert start!38810)

(declare-fun b!405211 () Bool)

(declare-fun res!233866 () Bool)

(declare-fun e!243663 () Bool)

(assert (=> b!405211 (=> (not res!233866) (not e!243663))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24366 0))(
  ( (array!24367 (arr!11632 (Array (_ BitVec 32) (_ BitVec 64))) (size!11984 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24366)

(assert (=> b!405211 (= res!233866 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11984 _keys!709))))))

(declare-fun b!405212 () Bool)

(declare-fun e!243659 () Bool)

(declare-fun tp_is_empty!10243 () Bool)

(assert (=> b!405212 (= e!243659 tp_is_empty!10243)))

(declare-fun b!405213 () Bool)

(declare-fun e!243661 () Bool)

(assert (=> b!405213 (= e!243661 false)))

(declare-fun lt!188327 () Bool)

(declare-fun lt!188328 () array!24366)

(declare-datatypes ((List!6644 0))(
  ( (Nil!6641) (Cons!6640 (h!7496 (_ BitVec 64)) (t!11810 List!6644)) )
))
(declare-fun arrayNoDuplicates!0 (array!24366 (_ BitVec 32) List!6644) Bool)

(assert (=> b!405213 (= lt!188327 (arrayNoDuplicates!0 lt!188328 #b00000000000000000000000000000000 Nil!6641))))

(declare-fun res!233867 () Bool)

(assert (=> start!38810 (=> (not res!233867) (not e!243663))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38810 (= res!233867 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11984 _keys!709))))))

(assert (=> start!38810 e!243663))

(assert (=> start!38810 true))

(declare-datatypes ((V!14763 0))(
  ( (V!14764 (val!5166 Int)) )
))
(declare-datatypes ((ValueCell!4778 0))(
  ( (ValueCellFull!4778 (v!7414 V!14763)) (EmptyCell!4778) )
))
(declare-datatypes ((array!24368 0))(
  ( (array!24369 (arr!11633 (Array (_ BitVec 32) ValueCell!4778)) (size!11985 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24368)

(declare-fun e!243660 () Bool)

(declare-fun array_inv!8592 (array!24368) Bool)

(assert (=> start!38810 (and (array_inv!8592 _values!549) e!243660)))

(declare-fun array_inv!8593 (array!24366) Bool)

(assert (=> start!38810 (array_inv!8593 _keys!709)))

(declare-fun b!405214 () Bool)

(declare-fun res!233874 () Bool)

(assert (=> b!405214 (=> (not res!233874) (not e!243663))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405214 (= res!233874 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16986 () Bool)

(declare-fun mapRes!16986 () Bool)

(assert (=> mapIsEmpty!16986 mapRes!16986))

(declare-fun b!405215 () Bool)

(declare-fun e!243664 () Bool)

(assert (=> b!405215 (= e!243664 tp_is_empty!10243)))

(declare-fun b!405216 () Bool)

(declare-fun res!233868 () Bool)

(assert (=> b!405216 (=> (not res!233868) (not e!243663))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405216 (= res!233868 (validMask!0 mask!1025))))

(declare-fun b!405217 () Bool)

(declare-fun res!233873 () Bool)

(assert (=> b!405217 (=> (not res!233873) (not e!243663))))

(assert (=> b!405217 (= res!233873 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6641))))

(declare-fun b!405218 () Bool)

(declare-fun res!233870 () Bool)

(assert (=> b!405218 (=> (not res!233870) (not e!243663))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405218 (= res!233870 (and (= (size!11985 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11984 _keys!709) (size!11985 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405219 () Bool)

(assert (=> b!405219 (= e!243660 (and e!243664 mapRes!16986))))

(declare-fun condMapEmpty!16986 () Bool)

(declare-fun mapDefault!16986 () ValueCell!4778)

(assert (=> b!405219 (= condMapEmpty!16986 (= (arr!11633 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4778)) mapDefault!16986)))))

(declare-fun mapNonEmpty!16986 () Bool)

(declare-fun tp!33105 () Bool)

(assert (=> mapNonEmpty!16986 (= mapRes!16986 (and tp!33105 e!243659))))

(declare-fun mapValue!16986 () ValueCell!4778)

(declare-fun mapRest!16986 () (Array (_ BitVec 32) ValueCell!4778))

(declare-fun mapKey!16986 () (_ BitVec 32))

(assert (=> mapNonEmpty!16986 (= (arr!11633 _values!549) (store mapRest!16986 mapKey!16986 mapValue!16986))))

(declare-fun b!405220 () Bool)

(declare-fun res!233865 () Bool)

(assert (=> b!405220 (=> (not res!233865) (not e!243663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405220 (= res!233865 (validKeyInArray!0 k0!794))))

(declare-fun b!405221 () Bool)

(assert (=> b!405221 (= e!243663 e!243661)))

(declare-fun res!233869 () Bool)

(assert (=> b!405221 (=> (not res!233869) (not e!243661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24366 (_ BitVec 32)) Bool)

(assert (=> b!405221 (= res!233869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188328 mask!1025))))

(assert (=> b!405221 (= lt!188328 (array!24367 (store (arr!11632 _keys!709) i!563 k0!794) (size!11984 _keys!709)))))

(declare-fun b!405222 () Bool)

(declare-fun res!233871 () Bool)

(assert (=> b!405222 (=> (not res!233871) (not e!243663))))

(assert (=> b!405222 (= res!233871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405223 () Bool)

(declare-fun res!233872 () Bool)

(assert (=> b!405223 (=> (not res!233872) (not e!243663))))

(assert (=> b!405223 (= res!233872 (or (= (select (arr!11632 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11632 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38810 res!233867) b!405216))

(assert (= (and b!405216 res!233868) b!405218))

(assert (= (and b!405218 res!233870) b!405222))

(assert (= (and b!405222 res!233871) b!405217))

(assert (= (and b!405217 res!233873) b!405211))

(assert (= (and b!405211 res!233866) b!405220))

(assert (= (and b!405220 res!233865) b!405223))

(assert (= (and b!405223 res!233872) b!405214))

(assert (= (and b!405214 res!233874) b!405221))

(assert (= (and b!405221 res!233869) b!405213))

(assert (= (and b!405219 condMapEmpty!16986) mapIsEmpty!16986))

(assert (= (and b!405219 (not condMapEmpty!16986)) mapNonEmpty!16986))

(get-info :version)

(assert (= (and mapNonEmpty!16986 ((_ is ValueCellFull!4778) mapValue!16986)) b!405212))

(assert (= (and b!405219 ((_ is ValueCellFull!4778) mapDefault!16986)) b!405215))

(assert (= start!38810 b!405219))

(declare-fun m!398013 () Bool)

(assert (=> start!38810 m!398013))

(declare-fun m!398015 () Bool)

(assert (=> start!38810 m!398015))

(declare-fun m!398017 () Bool)

(assert (=> b!405221 m!398017))

(declare-fun m!398019 () Bool)

(assert (=> b!405221 m!398019))

(declare-fun m!398021 () Bool)

(assert (=> b!405217 m!398021))

(declare-fun m!398023 () Bool)

(assert (=> b!405214 m!398023))

(declare-fun m!398025 () Bool)

(assert (=> b!405216 m!398025))

(declare-fun m!398027 () Bool)

(assert (=> b!405220 m!398027))

(declare-fun m!398029 () Bool)

(assert (=> b!405223 m!398029))

(declare-fun m!398031 () Bool)

(assert (=> mapNonEmpty!16986 m!398031))

(declare-fun m!398033 () Bool)

(assert (=> b!405213 m!398033))

(declare-fun m!398035 () Bool)

(assert (=> b!405222 m!398035))

(check-sat (not b!405222) (not start!38810) (not b!405217) (not b!405213) (not b!405221) (not b!405214) tp_is_empty!10243 (not mapNonEmpty!16986) (not b!405220) (not b!405216))
(check-sat)
