; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37626 () Bool)

(assert start!37626)

(declare-fun b!385337 () Bool)

(declare-fun res!219838 () Bool)

(declare-fun e!233856 () Bool)

(assert (=> b!385337 (=> (not res!219838) (not e!233856))))

(declare-datatypes ((array!22722 0))(
  ( (array!22723 (arr!10829 (Array (_ BitVec 32) (_ BitVec 64))) (size!11181 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22722)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22722 (_ BitVec 32)) Bool)

(assert (=> b!385337 (= res!219838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385338 () Bool)

(declare-fun e!233858 () Bool)

(declare-fun tp_is_empty!9415 () Bool)

(assert (=> b!385338 (= e!233858 tp_is_empty!9415)))

(declare-fun b!385339 () Bool)

(declare-fun e!233859 () Bool)

(assert (=> b!385339 (= e!233859 tp_is_empty!9415)))

(declare-fun res!219837 () Bool)

(assert (=> start!37626 (=> (not res!219837) (not e!233856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37626 (= res!219837 (validMask!0 mask!970))))

(assert (=> start!37626 e!233856))

(assert (=> start!37626 true))

(declare-datatypes ((V!13659 0))(
  ( (V!13660 (val!4752 Int)) )
))
(declare-datatypes ((ValueCell!4364 0))(
  ( (ValueCellFull!4364 (v!6950 V!13659)) (EmptyCell!4364) )
))
(declare-datatypes ((array!22724 0))(
  ( (array!22725 (arr!10830 (Array (_ BitVec 32) ValueCell!4364)) (size!11182 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22724)

(declare-fun e!233855 () Bool)

(declare-fun array_inv!8008 (array!22724) Bool)

(assert (=> start!37626 (and (array_inv!8008 _values!506) e!233855)))

(declare-fun array_inv!8009 (array!22722) Bool)

(assert (=> start!37626 (array_inv!8009 _keys!658)))

(declare-fun mapIsEmpty!15687 () Bool)

(declare-fun mapRes!15687 () Bool)

(assert (=> mapIsEmpty!15687 mapRes!15687))

(declare-fun b!385340 () Bool)

(assert (=> b!385340 (= e!233856 false)))

(declare-fun lt!181624 () Bool)

(declare-datatypes ((List!6111 0))(
  ( (Nil!6108) (Cons!6107 (h!6963 (_ BitVec 64)) (t!11253 List!6111)) )
))
(declare-fun arrayNoDuplicates!0 (array!22722 (_ BitVec 32) List!6111) Bool)

(assert (=> b!385340 (= lt!181624 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6108))))

(declare-fun b!385341 () Bool)

(declare-fun res!219839 () Bool)

(assert (=> b!385341 (=> (not res!219839) (not e!233856))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385341 (= res!219839 (and (= (size!11182 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11181 _keys!658) (size!11182 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385342 () Bool)

(assert (=> b!385342 (= e!233855 (and e!233859 mapRes!15687))))

(declare-fun condMapEmpty!15687 () Bool)

(declare-fun mapDefault!15687 () ValueCell!4364)

(assert (=> b!385342 (= condMapEmpty!15687 (= (arr!10830 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4364)) mapDefault!15687)))))

(declare-fun mapNonEmpty!15687 () Bool)

(declare-fun tp!31014 () Bool)

(assert (=> mapNonEmpty!15687 (= mapRes!15687 (and tp!31014 e!233858))))

(declare-fun mapKey!15687 () (_ BitVec 32))

(declare-fun mapRest!15687 () (Array (_ BitVec 32) ValueCell!4364))

(declare-fun mapValue!15687 () ValueCell!4364)

(assert (=> mapNonEmpty!15687 (= (arr!10830 _values!506) (store mapRest!15687 mapKey!15687 mapValue!15687))))

(assert (= (and start!37626 res!219837) b!385341))

(assert (= (and b!385341 res!219839) b!385337))

(assert (= (and b!385337 res!219838) b!385340))

(assert (= (and b!385342 condMapEmpty!15687) mapIsEmpty!15687))

(assert (= (and b!385342 (not condMapEmpty!15687)) mapNonEmpty!15687))

(get-info :version)

(assert (= (and mapNonEmpty!15687 ((_ is ValueCellFull!4364) mapValue!15687)) b!385338))

(assert (= (and b!385342 ((_ is ValueCellFull!4364) mapDefault!15687)) b!385339))

(assert (= start!37626 b!385342))

(declare-fun m!382265 () Bool)

(assert (=> b!385337 m!382265))

(declare-fun m!382267 () Bool)

(assert (=> start!37626 m!382267))

(declare-fun m!382269 () Bool)

(assert (=> start!37626 m!382269))

(declare-fun m!382271 () Bool)

(assert (=> start!37626 m!382271))

(declare-fun m!382273 () Bool)

(assert (=> b!385340 m!382273))

(declare-fun m!382275 () Bool)

(assert (=> mapNonEmpty!15687 m!382275))

(check-sat (not b!385340) (not mapNonEmpty!15687) (not b!385337) (not start!37626) tp_is_empty!9415)
(check-sat)
