; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36768 () Bool)

(assert start!36768)

(declare-fun b!367019 () Bool)

(declare-fun res!205477 () Bool)

(declare-fun e!224616 () Bool)

(assert (=> b!367019 (=> (not res!205477) (not e!224616))))

(declare-datatypes ((array!21055 0))(
  ( (array!21056 (arr!9996 (Array (_ BitVec 32) (_ BitVec 64))) (size!10349 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21055)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367019 (= res!205477 (or (= (select (arr!9996 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9996 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367020 () Bool)

(declare-fun e!224618 () Bool)

(declare-fun tp_is_empty!8557 () Bool)

(assert (=> b!367020 (= e!224618 tp_is_empty!8557)))

(declare-fun res!205484 () Bool)

(assert (=> start!36768 (=> (not res!205484) (not e!224616))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36768 (= res!205484 (validMask!0 mask!970))))

(assert (=> start!36768 e!224616))

(assert (=> start!36768 true))

(declare-datatypes ((V!12515 0))(
  ( (V!12516 (val!4323 Int)) )
))
(declare-datatypes ((ValueCell!3935 0))(
  ( (ValueCellFull!3935 (v!6514 V!12515)) (EmptyCell!3935) )
))
(declare-datatypes ((array!21057 0))(
  ( (array!21058 (arr!9997 (Array (_ BitVec 32) ValueCell!3935)) (size!10350 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21057)

(declare-fun e!224620 () Bool)

(declare-fun array_inv!7408 (array!21057) Bool)

(assert (=> start!36768 (and (array_inv!7408 _values!506) e!224620)))

(declare-fun array_inv!7409 (array!21055) Bool)

(assert (=> start!36768 (array_inv!7409 _keys!658)))

(declare-fun mapIsEmpty!14400 () Bool)

(declare-fun mapRes!14400 () Bool)

(assert (=> mapIsEmpty!14400 mapRes!14400))

(declare-fun b!367021 () Bool)

(declare-fun res!205481 () Bool)

(assert (=> b!367021 (=> (not res!205481) (not e!224616))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367021 (= res!205481 (validKeyInArray!0 k0!778))))

(declare-fun b!367022 () Bool)

(declare-fun res!205483 () Bool)

(assert (=> b!367022 (=> (not res!205483) (not e!224616))))

(declare-fun arrayContainsKey!0 (array!21055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367022 (= res!205483 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367023 () Bool)

(declare-fun res!205480 () Bool)

(assert (=> b!367023 (=> (not res!205480) (not e!224616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21055 (_ BitVec 32)) Bool)

(assert (=> b!367023 (= res!205480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367024 () Bool)

(declare-fun e!224621 () Bool)

(assert (=> b!367024 (= e!224620 (and e!224621 mapRes!14400))))

(declare-fun condMapEmpty!14400 () Bool)

(declare-fun mapDefault!14400 () ValueCell!3935)

(assert (=> b!367024 (= condMapEmpty!14400 (= (arr!9997 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3935)) mapDefault!14400)))))

(declare-fun b!367025 () Bool)

(declare-fun res!205476 () Bool)

(assert (=> b!367025 (=> (not res!205476) (not e!224616))))

(declare-datatypes ((List!5528 0))(
  ( (Nil!5525) (Cons!5524 (h!6380 (_ BitVec 64)) (t!10669 List!5528)) )
))
(declare-fun arrayNoDuplicates!0 (array!21055 (_ BitVec 32) List!5528) Bool)

(assert (=> b!367025 (= res!205476 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5525))))

(declare-fun mapNonEmpty!14400 () Bool)

(declare-fun tp!28476 () Bool)

(assert (=> mapNonEmpty!14400 (= mapRes!14400 (and tp!28476 e!224618))))

(declare-fun mapRest!14400 () (Array (_ BitVec 32) ValueCell!3935))

(declare-fun mapKey!14400 () (_ BitVec 32))

(declare-fun mapValue!14400 () ValueCell!3935)

(assert (=> mapNonEmpty!14400 (= (arr!9997 _values!506) (store mapRest!14400 mapKey!14400 mapValue!14400))))

(declare-fun b!367026 () Bool)

(declare-fun e!224619 () Bool)

(assert (=> b!367026 (= e!224619 false)))

(declare-fun lt!169125 () Bool)

(declare-fun lt!169124 () array!21055)

(assert (=> b!367026 (= lt!169125 (arrayNoDuplicates!0 lt!169124 #b00000000000000000000000000000000 Nil!5525))))

(declare-fun b!367027 () Bool)

(assert (=> b!367027 (= e!224616 e!224619)))

(declare-fun res!205478 () Bool)

(assert (=> b!367027 (=> (not res!205478) (not e!224619))))

(assert (=> b!367027 (= res!205478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169124 mask!970))))

(assert (=> b!367027 (= lt!169124 (array!21056 (store (arr!9996 _keys!658) i!548 k0!778) (size!10349 _keys!658)))))

(declare-fun b!367028 () Bool)

(declare-fun res!205482 () Bool)

(assert (=> b!367028 (=> (not res!205482) (not e!224616))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367028 (= res!205482 (and (= (size!10350 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10349 _keys!658) (size!10350 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367029 () Bool)

(declare-fun res!205479 () Bool)

(assert (=> b!367029 (=> (not res!205479) (not e!224616))))

(assert (=> b!367029 (= res!205479 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10349 _keys!658))))))

(declare-fun b!367030 () Bool)

(assert (=> b!367030 (= e!224621 tp_is_empty!8557)))

(assert (= (and start!36768 res!205484) b!367028))

(assert (= (and b!367028 res!205482) b!367023))

(assert (= (and b!367023 res!205480) b!367025))

(assert (= (and b!367025 res!205476) b!367029))

(assert (= (and b!367029 res!205479) b!367021))

(assert (= (and b!367021 res!205481) b!367019))

(assert (= (and b!367019 res!205477) b!367022))

(assert (= (and b!367022 res!205483) b!367027))

(assert (= (and b!367027 res!205478) b!367026))

(assert (= (and b!367024 condMapEmpty!14400) mapIsEmpty!14400))

(assert (= (and b!367024 (not condMapEmpty!14400)) mapNonEmpty!14400))

(get-info :version)

(assert (= (and mapNonEmpty!14400 ((_ is ValueCellFull!3935) mapValue!14400)) b!367020))

(assert (= (and b!367024 ((_ is ValueCellFull!3935) mapDefault!14400)) b!367030))

(assert (= start!36768 b!367024))

(declare-fun m!363599 () Bool)

(assert (=> b!367021 m!363599))

(declare-fun m!363601 () Bool)

(assert (=> b!367026 m!363601))

(declare-fun m!363603 () Bool)

(assert (=> b!367022 m!363603))

(declare-fun m!363605 () Bool)

(assert (=> b!367025 m!363605))

(declare-fun m!363607 () Bool)

(assert (=> b!367019 m!363607))

(declare-fun m!363609 () Bool)

(assert (=> mapNonEmpty!14400 m!363609))

(declare-fun m!363611 () Bool)

(assert (=> b!367023 m!363611))

(declare-fun m!363613 () Bool)

(assert (=> start!36768 m!363613))

(declare-fun m!363615 () Bool)

(assert (=> start!36768 m!363615))

(declare-fun m!363617 () Bool)

(assert (=> start!36768 m!363617))

(declare-fun m!363619 () Bool)

(assert (=> b!367027 m!363619))

(declare-fun m!363621 () Bool)

(assert (=> b!367027 m!363621))

(check-sat (not start!36768) (not b!367021) (not b!367022) (not b!367026) (not b!367023) (not mapNonEmpty!14400) (not b!367025) (not b!367027) tp_is_empty!8557)
(check-sat)
