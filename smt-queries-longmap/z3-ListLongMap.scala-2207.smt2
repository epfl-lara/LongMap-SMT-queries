; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36642 () Bool)

(assert start!36642)

(declare-fun b!365538 () Bool)

(declare-fun e!223848 () Bool)

(declare-fun tp_is_empty!8479 () Bool)

(assert (=> b!365538 (= e!223848 tp_is_empty!8479)))

(declare-fun res!204412 () Bool)

(declare-fun e!223851 () Bool)

(assert (=> start!36642 (=> (not res!204412) (not e!223851))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36642 (= res!204412 (validMask!0 mask!970))))

(assert (=> start!36642 e!223851))

(assert (=> start!36642 true))

(declare-datatypes ((V!12411 0))(
  ( (V!12412 (val!4284 Int)) )
))
(declare-datatypes ((ValueCell!3896 0))(
  ( (ValueCellFull!3896 (v!6474 V!12411)) (EmptyCell!3896) )
))
(declare-datatypes ((array!20899 0))(
  ( (array!20900 (arr!9921 (Array (_ BitVec 32) ValueCell!3896)) (size!10274 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20899)

(declare-fun e!223849 () Bool)

(declare-fun array_inv!7356 (array!20899) Bool)

(assert (=> start!36642 (and (array_inv!7356 _values!506) e!223849)))

(declare-datatypes ((array!20901 0))(
  ( (array!20902 (arr!9922 (Array (_ BitVec 32) (_ BitVec 64))) (size!10275 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20901)

(declare-fun array_inv!7357 (array!20901) Bool)

(assert (=> start!36642 (array_inv!7357 _keys!658)))

(declare-fun b!365539 () Bool)

(declare-fun res!204413 () Bool)

(assert (=> b!365539 (=> (not res!204413) (not e!223851))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365539 (= res!204413 (and (= (size!10274 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10275 _keys!658) (size!10274 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365540 () Bool)

(declare-fun e!223847 () Bool)

(assert (=> b!365540 (= e!223847 tp_is_empty!8479)))

(declare-fun b!365541 () Bool)

(assert (=> b!365541 (= e!223851 false)))

(declare-fun lt!168974 () Bool)

(declare-datatypes ((List!5500 0))(
  ( (Nil!5497) (Cons!5496 (h!6352 (_ BitVec 64)) (t!10641 List!5500)) )
))
(declare-fun arrayNoDuplicates!0 (array!20901 (_ BitVec 32) List!5500) Bool)

(assert (=> b!365541 (= lt!168974 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5497))))

(declare-fun b!365542 () Bool)

(declare-fun mapRes!14274 () Bool)

(assert (=> b!365542 (= e!223849 (and e!223848 mapRes!14274))))

(declare-fun condMapEmpty!14274 () Bool)

(declare-fun mapDefault!14274 () ValueCell!3896)

(assert (=> b!365542 (= condMapEmpty!14274 (= (arr!9921 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3896)) mapDefault!14274)))))

(declare-fun mapNonEmpty!14274 () Bool)

(declare-fun tp!28350 () Bool)

(assert (=> mapNonEmpty!14274 (= mapRes!14274 (and tp!28350 e!223847))))

(declare-fun mapValue!14274 () ValueCell!3896)

(declare-fun mapRest!14274 () (Array (_ BitVec 32) ValueCell!3896))

(declare-fun mapKey!14274 () (_ BitVec 32))

(assert (=> mapNonEmpty!14274 (= (arr!9921 _values!506) (store mapRest!14274 mapKey!14274 mapValue!14274))))

(declare-fun mapIsEmpty!14274 () Bool)

(assert (=> mapIsEmpty!14274 mapRes!14274))

(declare-fun b!365543 () Bool)

(declare-fun res!204414 () Bool)

(assert (=> b!365543 (=> (not res!204414) (not e!223851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20901 (_ BitVec 32)) Bool)

(assert (=> b!365543 (= res!204414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36642 res!204412) b!365539))

(assert (= (and b!365539 res!204413) b!365543))

(assert (= (and b!365543 res!204414) b!365541))

(assert (= (and b!365542 condMapEmpty!14274) mapIsEmpty!14274))

(assert (= (and b!365542 (not condMapEmpty!14274)) mapNonEmpty!14274))

(get-info :version)

(assert (= (and mapNonEmpty!14274 ((_ is ValueCellFull!3896) mapValue!14274)) b!365540))

(assert (= (and b!365542 ((_ is ValueCellFull!3896) mapDefault!14274)) b!365538))

(assert (= start!36642 b!365542))

(declare-fun m!362657 () Bool)

(assert (=> start!36642 m!362657))

(declare-fun m!362659 () Bool)

(assert (=> start!36642 m!362659))

(declare-fun m!362661 () Bool)

(assert (=> start!36642 m!362661))

(declare-fun m!362663 () Bool)

(assert (=> b!365541 m!362663))

(declare-fun m!362665 () Bool)

(assert (=> mapNonEmpty!14274 m!362665))

(declare-fun m!362667 () Bool)

(assert (=> b!365543 m!362667))

(check-sat tp_is_empty!8479 (not mapNonEmpty!14274) (not start!36642) (not b!365543) (not b!365541))
(check-sat)
