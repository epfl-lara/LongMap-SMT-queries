; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36666 () Bool)

(assert start!36666)

(declare-fun b!365856 () Bool)

(declare-fun e!224029 () Bool)

(declare-datatypes ((array!20945 0))(
  ( (array!20946 (arr!9944 (Array (_ BitVec 32) (_ BitVec 64))) (size!10297 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20945)

(assert (=> b!365856 (= e!224029 (bvsgt #b00000000000000000000000000000000 (size!10297 _keys!658)))))

(declare-fun b!365857 () Bool)

(declare-fun res!204626 () Bool)

(assert (=> b!365857 (=> (not res!204626) (not e!224029))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365857 (= res!204626 (or (= (select (arr!9944 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9944 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!204624 () Bool)

(assert (=> start!36666 (=> (not res!204624) (not e!224029))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36666 (= res!204624 (validMask!0 mask!970))))

(assert (=> start!36666 e!224029))

(assert (=> start!36666 true))

(declare-datatypes ((V!12443 0))(
  ( (V!12444 (val!4296 Int)) )
))
(declare-datatypes ((ValueCell!3908 0))(
  ( (ValueCellFull!3908 (v!6486 V!12443)) (EmptyCell!3908) )
))
(declare-datatypes ((array!20947 0))(
  ( (array!20948 (arr!9945 (Array (_ BitVec 32) ValueCell!3908)) (size!10298 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20947)

(declare-fun e!224028 () Bool)

(declare-fun array_inv!7372 (array!20947) Bool)

(assert (=> start!36666 (and (array_inv!7372 _values!506) e!224028)))

(declare-fun array_inv!7373 (array!20945) Bool)

(assert (=> start!36666 (array_inv!7373 _keys!658)))

(declare-fun b!365858 () Bool)

(declare-fun res!204629 () Bool)

(assert (=> b!365858 (=> (not res!204629) (not e!224029))))

(assert (=> b!365858 (= res!204629 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10297 _keys!658))))))

(declare-fun b!365859 () Bool)

(declare-fun res!204625 () Bool)

(assert (=> b!365859 (=> (not res!204625) (not e!224029))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20945 (_ BitVec 32)) Bool)

(assert (=> b!365859 (= res!204625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20946 (store (arr!9944 _keys!658) i!548 k0!778) (size!10297 _keys!658)) mask!970))))

(declare-fun b!365860 () Bool)

(declare-fun res!204630 () Bool)

(assert (=> b!365860 (=> (not res!204630) (not e!224029))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365860 (= res!204630 (and (= (size!10298 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10297 _keys!658) (size!10298 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365861 () Bool)

(declare-fun e!224027 () Bool)

(declare-fun mapRes!14310 () Bool)

(assert (=> b!365861 (= e!224028 (and e!224027 mapRes!14310))))

(declare-fun condMapEmpty!14310 () Bool)

(declare-fun mapDefault!14310 () ValueCell!3908)

(assert (=> b!365861 (= condMapEmpty!14310 (= (arr!9945 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3908)) mapDefault!14310)))))

(declare-fun b!365862 () Bool)

(declare-fun res!204628 () Bool)

(assert (=> b!365862 (=> (not res!204628) (not e!224029))))

(assert (=> b!365862 (= res!204628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365863 () Bool)

(declare-fun res!204623 () Bool)

(assert (=> b!365863 (=> (not res!204623) (not e!224029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365863 (= res!204623 (validKeyInArray!0 k0!778))))

(declare-fun b!365864 () Bool)

(declare-fun e!224031 () Bool)

(declare-fun tp_is_empty!8503 () Bool)

(assert (=> b!365864 (= e!224031 tp_is_empty!8503)))

(declare-fun mapNonEmpty!14310 () Bool)

(declare-fun tp!28386 () Bool)

(assert (=> mapNonEmpty!14310 (= mapRes!14310 (and tp!28386 e!224031))))

(declare-fun mapKey!14310 () (_ BitVec 32))

(declare-fun mapRest!14310 () (Array (_ BitVec 32) ValueCell!3908))

(declare-fun mapValue!14310 () ValueCell!3908)

(assert (=> mapNonEmpty!14310 (= (arr!9945 _values!506) (store mapRest!14310 mapKey!14310 mapValue!14310))))

(declare-fun b!365865 () Bool)

(declare-fun res!204622 () Bool)

(assert (=> b!365865 (=> (not res!204622) (not e!224029))))

(declare-fun arrayContainsKey!0 (array!20945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365865 (= res!204622 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14310 () Bool)

(assert (=> mapIsEmpty!14310 mapRes!14310))

(declare-fun b!365866 () Bool)

(assert (=> b!365866 (= e!224027 tp_is_empty!8503)))

(declare-fun b!365867 () Bool)

(declare-fun res!204627 () Bool)

(assert (=> b!365867 (=> (not res!204627) (not e!224029))))

(declare-datatypes ((List!5508 0))(
  ( (Nil!5505) (Cons!5504 (h!6360 (_ BitVec 64)) (t!10649 List!5508)) )
))
(declare-fun arrayNoDuplicates!0 (array!20945 (_ BitVec 32) List!5508) Bool)

(assert (=> b!365867 (= res!204627 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5505))))

(assert (= (and start!36666 res!204624) b!365860))

(assert (= (and b!365860 res!204630) b!365862))

(assert (= (and b!365862 res!204628) b!365867))

(assert (= (and b!365867 res!204627) b!365858))

(assert (= (and b!365858 res!204629) b!365863))

(assert (= (and b!365863 res!204623) b!365857))

(assert (= (and b!365857 res!204626) b!365865))

(assert (= (and b!365865 res!204622) b!365859))

(assert (= (and b!365859 res!204625) b!365856))

(assert (= (and b!365861 condMapEmpty!14310) mapIsEmpty!14310))

(assert (= (and b!365861 (not condMapEmpty!14310)) mapNonEmpty!14310))

(get-info :version)

(assert (= (and mapNonEmpty!14310 ((_ is ValueCellFull!3908) mapValue!14310)) b!365864))

(assert (= (and b!365861 ((_ is ValueCellFull!3908) mapDefault!14310)) b!365866))

(assert (= start!36666 b!365861))

(declare-fun m!362837 () Bool)

(assert (=> b!365865 m!362837))

(declare-fun m!362839 () Bool)

(assert (=> b!365859 m!362839))

(declare-fun m!362841 () Bool)

(assert (=> b!365859 m!362841))

(declare-fun m!362843 () Bool)

(assert (=> start!36666 m!362843))

(declare-fun m!362845 () Bool)

(assert (=> start!36666 m!362845))

(declare-fun m!362847 () Bool)

(assert (=> start!36666 m!362847))

(declare-fun m!362849 () Bool)

(assert (=> mapNonEmpty!14310 m!362849))

(declare-fun m!362851 () Bool)

(assert (=> b!365867 m!362851))

(declare-fun m!362853 () Bool)

(assert (=> b!365862 m!362853))

(declare-fun m!362855 () Bool)

(assert (=> b!365863 m!362855))

(declare-fun m!362857 () Bool)

(assert (=> b!365857 m!362857))

(check-sat (not b!365867) tp_is_empty!8503 (not b!365862) (not b!365859) (not b!365863) (not start!36666) (not b!365865) (not mapNonEmpty!14310))
(check-sat)
