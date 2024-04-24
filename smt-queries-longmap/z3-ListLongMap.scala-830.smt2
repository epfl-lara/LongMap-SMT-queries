; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20080 () Bool)

(assert start!20080)

(declare-fun b!196628 () Bool)

(declare-fun e!129518 () Bool)

(declare-fun e!129517 () Bool)

(declare-fun mapRes!7955 () Bool)

(assert (=> b!196628 (= e!129518 (and e!129517 mapRes!7955))))

(declare-fun condMapEmpty!7955 () Bool)

(declare-datatypes ((V!5769 0))(
  ( (V!5770 (val!2340 Int)) )
))
(declare-datatypes ((ValueCell!1952 0))(
  ( (ValueCellFull!1952 (v!4311 V!5769)) (EmptyCell!1952) )
))
(declare-datatypes ((array!8427 0))(
  ( (array!8428 (arr!3964 (Array (_ BitVec 32) ValueCell!1952)) (size!4289 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8427)

(declare-fun mapDefault!7955 () ValueCell!1952)

(assert (=> b!196628 (= condMapEmpty!7955 (= (arr!3964 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1952)) mapDefault!7955)))))

(declare-fun b!196629 () Bool)

(declare-fun res!92813 () Bool)

(declare-fun e!129515 () Bool)

(assert (=> b!196629 (=> (not res!92813) (not e!129515))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!8429 0))(
  ( (array!8430 (arr!3965 (Array (_ BitVec 32) (_ BitVec 64))) (size!4290 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8429)

(assert (=> b!196629 (= res!92813 (and (= (size!4289 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4290 _keys!825) (size!4289 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7955 () Bool)

(assert (=> mapIsEmpty!7955 mapRes!7955))

(declare-fun b!196630 () Bool)

(declare-fun res!92810 () Bool)

(assert (=> b!196630 (=> (not res!92810) (not e!129515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8429 (_ BitVec 32)) Bool)

(assert (=> b!196630 (= res!92810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun b!196631 () Bool)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196631 (= e!129515 (and (= (select (arr!3965 _keys!825) i!601) k0!843) (bvsgt #b00000000000000000000000000000000 (size!4290 _keys!825))))))

(declare-fun b!196632 () Bool)

(declare-fun tp_is_empty!4591 () Bool)

(assert (=> b!196632 (= e!129517 tp_is_empty!4591)))

(declare-fun b!196634 () Bool)

(declare-fun res!92812 () Bool)

(assert (=> b!196634 (=> (not res!92812) (not e!129515))))

(assert (=> b!196634 (= res!92812 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4290 _keys!825))))))

(declare-fun mapNonEmpty!7955 () Bool)

(declare-fun tp!17243 () Bool)

(declare-fun e!129514 () Bool)

(assert (=> mapNonEmpty!7955 (= mapRes!7955 (and tp!17243 e!129514))))

(declare-fun mapValue!7955 () ValueCell!1952)

(declare-fun mapKey!7955 () (_ BitVec 32))

(declare-fun mapRest!7955 () (Array (_ BitVec 32) ValueCell!1952))

(assert (=> mapNonEmpty!7955 (= (arr!3964 _values!649) (store mapRest!7955 mapKey!7955 mapValue!7955))))

(declare-fun b!196635 () Bool)

(declare-fun res!92811 () Bool)

(assert (=> b!196635 (=> (not res!92811) (not e!129515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196635 (= res!92811 (validKeyInArray!0 k0!843))))

(declare-fun b!196636 () Bool)

(assert (=> b!196636 (= e!129514 tp_is_empty!4591)))

(declare-fun res!92814 () Bool)

(assert (=> start!20080 (=> (not res!92814) (not e!129515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20080 (= res!92814 (validMask!0 mask!1149))))

(assert (=> start!20080 e!129515))

(declare-fun array_inv!2573 (array!8429) Bool)

(assert (=> start!20080 (array_inv!2573 _keys!825)))

(assert (=> start!20080 true))

(declare-fun array_inv!2574 (array!8427) Bool)

(assert (=> start!20080 (and (array_inv!2574 _values!649) e!129518)))

(declare-fun b!196633 () Bool)

(declare-fun res!92815 () Bool)

(assert (=> b!196633 (=> (not res!92815) (not e!129515))))

(declare-datatypes ((List!2432 0))(
  ( (Nil!2429) (Cons!2428 (h!3070 (_ BitVec 64)) (t!7355 List!2432)) )
))
(declare-fun arrayNoDuplicates!0 (array!8429 (_ BitVec 32) List!2432) Bool)

(assert (=> b!196633 (= res!92815 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2429))))

(assert (= (and start!20080 res!92814) b!196629))

(assert (= (and b!196629 res!92813) b!196630))

(assert (= (and b!196630 res!92810) b!196633))

(assert (= (and b!196633 res!92815) b!196634))

(assert (= (and b!196634 res!92812) b!196635))

(assert (= (and b!196635 res!92811) b!196631))

(assert (= (and b!196628 condMapEmpty!7955) mapIsEmpty!7955))

(assert (= (and b!196628 (not condMapEmpty!7955)) mapNonEmpty!7955))

(get-info :version)

(assert (= (and mapNonEmpty!7955 ((_ is ValueCellFull!1952) mapValue!7955)) b!196636))

(assert (= (and b!196628 ((_ is ValueCellFull!1952) mapDefault!7955)) b!196632))

(assert (= start!20080 b!196628))

(declare-fun m!223989 () Bool)

(assert (=> b!196631 m!223989))

(declare-fun m!223991 () Bool)

(assert (=> mapNonEmpty!7955 m!223991))

(declare-fun m!223993 () Bool)

(assert (=> b!196633 m!223993))

(declare-fun m!223995 () Bool)

(assert (=> start!20080 m!223995))

(declare-fun m!223997 () Bool)

(assert (=> start!20080 m!223997))

(declare-fun m!223999 () Bool)

(assert (=> start!20080 m!223999))

(declare-fun m!224001 () Bool)

(assert (=> b!196635 m!224001))

(declare-fun m!224003 () Bool)

(assert (=> b!196630 m!224003))

(check-sat (not start!20080) tp_is_empty!4591 (not mapNonEmpty!7955) (not b!196633) (not b!196635) (not b!196630))
(check-sat)
