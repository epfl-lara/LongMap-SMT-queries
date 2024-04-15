; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37626 () Bool)

(assert start!37626)

(declare-fun b!385115 () Bool)

(declare-fun e!233713 () Bool)

(declare-fun tp_is_empty!9415 () Bool)

(assert (=> b!385115 (= e!233713 tp_is_empty!9415)))

(declare-fun b!385116 () Bool)

(declare-fun e!233715 () Bool)

(assert (=> b!385116 (= e!233715 false)))

(declare-fun lt!181371 () Bool)

(declare-datatypes ((array!22717 0))(
  ( (array!22718 (arr!10827 (Array (_ BitVec 32) (_ BitVec 64))) (size!11180 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22717)

(declare-datatypes ((List!6210 0))(
  ( (Nil!6207) (Cons!6206 (h!7062 (_ BitVec 64)) (t!11351 List!6210)) )
))
(declare-fun arrayNoDuplicates!0 (array!22717 (_ BitVec 32) List!6210) Bool)

(assert (=> b!385116 (= lt!181371 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6207))))

(declare-fun b!385117 () Bool)

(declare-fun e!233714 () Bool)

(declare-fun mapRes!15687 () Bool)

(assert (=> b!385117 (= e!233714 (and e!233713 mapRes!15687))))

(declare-fun condMapEmpty!15687 () Bool)

(declare-datatypes ((V!13659 0))(
  ( (V!13660 (val!4752 Int)) )
))
(declare-datatypes ((ValueCell!4364 0))(
  ( (ValueCellFull!4364 (v!6943 V!13659)) (EmptyCell!4364) )
))
(declare-datatypes ((array!22719 0))(
  ( (array!22720 (arr!10828 (Array (_ BitVec 32) ValueCell!4364)) (size!11181 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22719)

(declare-fun mapDefault!15687 () ValueCell!4364)

(assert (=> b!385117 (= condMapEmpty!15687 (= (arr!10828 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4364)) mapDefault!15687)))))

(declare-fun mapIsEmpty!15687 () Bool)

(assert (=> mapIsEmpty!15687 mapRes!15687))

(declare-fun res!219711 () Bool)

(assert (=> start!37626 (=> (not res!219711) (not e!233715))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37626 (= res!219711 (validMask!0 mask!970))))

(assert (=> start!37626 e!233715))

(assert (=> start!37626 true))

(declare-fun array_inv!7970 (array!22719) Bool)

(assert (=> start!37626 (and (array_inv!7970 _values!506) e!233714)))

(declare-fun array_inv!7971 (array!22717) Bool)

(assert (=> start!37626 (array_inv!7971 _keys!658)))

(declare-fun mapNonEmpty!15687 () Bool)

(declare-fun tp!31014 () Bool)

(declare-fun e!233717 () Bool)

(assert (=> mapNonEmpty!15687 (= mapRes!15687 (and tp!31014 e!233717))))

(declare-fun mapRest!15687 () (Array (_ BitVec 32) ValueCell!4364))

(declare-fun mapKey!15687 () (_ BitVec 32))

(declare-fun mapValue!15687 () ValueCell!4364)

(assert (=> mapNonEmpty!15687 (= (arr!10828 _values!506) (store mapRest!15687 mapKey!15687 mapValue!15687))))

(declare-fun b!385118 () Bool)

(declare-fun res!219713 () Bool)

(assert (=> b!385118 (=> (not res!219713) (not e!233715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22717 (_ BitVec 32)) Bool)

(assert (=> b!385118 (= res!219713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385119 () Bool)

(declare-fun res!219712 () Bool)

(assert (=> b!385119 (=> (not res!219712) (not e!233715))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385119 (= res!219712 (and (= (size!11181 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11180 _keys!658) (size!11181 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385120 () Bool)

(assert (=> b!385120 (= e!233717 tp_is_empty!9415)))

(assert (= (and start!37626 res!219711) b!385119))

(assert (= (and b!385119 res!219712) b!385118))

(assert (= (and b!385118 res!219713) b!385116))

(assert (= (and b!385117 condMapEmpty!15687) mapIsEmpty!15687))

(assert (= (and b!385117 (not condMapEmpty!15687)) mapNonEmpty!15687))

(get-info :version)

(assert (= (and mapNonEmpty!15687 ((_ is ValueCellFull!4364) mapValue!15687)) b!385120))

(assert (= (and b!385117 ((_ is ValueCellFull!4364) mapDefault!15687)) b!385115))

(assert (= start!37626 b!385117))

(declare-fun m!381311 () Bool)

(assert (=> b!385116 m!381311))

(declare-fun m!381313 () Bool)

(assert (=> start!37626 m!381313))

(declare-fun m!381315 () Bool)

(assert (=> start!37626 m!381315))

(declare-fun m!381317 () Bool)

(assert (=> start!37626 m!381317))

(declare-fun m!381319 () Bool)

(assert (=> mapNonEmpty!15687 m!381319))

(declare-fun m!381321 () Bool)

(assert (=> b!385118 m!381321))

(check-sat (not mapNonEmpty!15687) (not b!385118) (not start!37626) tp_is_empty!9415 (not b!385116))
(check-sat)
