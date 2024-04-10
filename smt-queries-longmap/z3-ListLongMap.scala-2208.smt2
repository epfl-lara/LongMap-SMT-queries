; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36664 () Bool)

(assert start!36664)

(declare-fun b!365906 () Bool)

(declare-fun e!224082 () Bool)

(declare-fun tp_is_empty!8487 () Bool)

(assert (=> b!365906 (= e!224082 tp_is_empty!8487)))

(declare-fun b!365907 () Bool)

(declare-fun res!204607 () Bool)

(declare-fun e!224084 () Bool)

(assert (=> b!365907 (=> (not res!204607) (not e!224084))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365907 (= res!204607 (validKeyInArray!0 k0!778))))

(declare-fun res!204606 () Bool)

(assert (=> start!36664 (=> (not res!204606) (not e!224084))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36664 (= res!204606 (validMask!0 mask!970))))

(assert (=> start!36664 e!224084))

(assert (=> start!36664 true))

(declare-datatypes ((V!12421 0))(
  ( (V!12422 (val!4288 Int)) )
))
(declare-datatypes ((ValueCell!3900 0))(
  ( (ValueCellFull!3900 (v!6484 V!12421)) (EmptyCell!3900) )
))
(declare-datatypes ((array!20927 0))(
  ( (array!20928 (arr!9935 (Array (_ BitVec 32) ValueCell!3900)) (size!10287 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20927)

(declare-fun e!224085 () Bool)

(declare-fun array_inv!7352 (array!20927) Bool)

(assert (=> start!36664 (and (array_inv!7352 _values!506) e!224085)))

(declare-datatypes ((array!20929 0))(
  ( (array!20930 (arr!9936 (Array (_ BitVec 32) (_ BitVec 64))) (size!10288 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20929)

(declare-fun array_inv!7353 (array!20929) Bool)

(assert (=> start!36664 (array_inv!7353 _keys!658)))

(declare-fun b!365908 () Bool)

(declare-fun res!204609 () Bool)

(assert (=> b!365908 (=> (not res!204609) (not e!224084))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365908 (= res!204609 (and (= (size!10287 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10288 _keys!658) (size!10287 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365909 () Bool)

(declare-fun e!224083 () Bool)

(declare-fun mapRes!14286 () Bool)

(assert (=> b!365909 (= e!224085 (and e!224083 mapRes!14286))))

(declare-fun condMapEmpty!14286 () Bool)

(declare-fun mapDefault!14286 () ValueCell!3900)

(assert (=> b!365909 (= condMapEmpty!14286 (= (arr!9935 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3900)) mapDefault!14286)))))

(declare-fun b!365910 () Bool)

(assert (=> b!365910 (= e!224083 tp_is_empty!8487)))

(declare-fun mapNonEmpty!14286 () Bool)

(declare-fun tp!28362 () Bool)

(assert (=> mapNonEmpty!14286 (= mapRes!14286 (and tp!28362 e!224082))))

(declare-fun mapRest!14286 () (Array (_ BitVec 32) ValueCell!3900))

(declare-fun mapValue!14286 () ValueCell!3900)

(declare-fun mapKey!14286 () (_ BitVec 32))

(assert (=> mapNonEmpty!14286 (= (arr!9935 _values!506) (store mapRest!14286 mapKey!14286 mapValue!14286))))

(declare-fun b!365911 () Bool)

(assert (=> b!365911 (= e!224084 (not (= (size!10288 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970))))))

(declare-fun b!365912 () Bool)

(declare-fun res!204602 () Bool)

(assert (=> b!365912 (=> (not res!204602) (not e!224084))))

(declare-datatypes ((List!5537 0))(
  ( (Nil!5534) (Cons!5533 (h!6389 (_ BitVec 64)) (t!10687 List!5537)) )
))
(declare-fun arrayNoDuplicates!0 (array!20929 (_ BitVec 32) List!5537) Bool)

(assert (=> b!365912 (= res!204602 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5534))))

(declare-fun b!365913 () Bool)

(declare-fun res!204608 () Bool)

(assert (=> b!365913 (=> (not res!204608) (not e!224084))))

(declare-fun arrayContainsKey!0 (array!20929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365913 (= res!204608 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!365914 () Bool)

(declare-fun res!204603 () Bool)

(assert (=> b!365914 (=> (not res!204603) (not e!224084))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365914 (= res!204603 (or (= (select (arr!9936 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9936 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14286 () Bool)

(assert (=> mapIsEmpty!14286 mapRes!14286))

(declare-fun b!365915 () Bool)

(declare-fun res!204604 () Bool)

(assert (=> b!365915 (=> (not res!204604) (not e!224084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20929 (_ BitVec 32)) Bool)

(assert (=> b!365915 (= res!204604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365916 () Bool)

(declare-fun res!204605 () Bool)

(assert (=> b!365916 (=> (not res!204605) (not e!224084))))

(assert (=> b!365916 (= res!204605 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10288 _keys!658))))))

(assert (= (and start!36664 res!204606) b!365908))

(assert (= (and b!365908 res!204609) b!365915))

(assert (= (and b!365915 res!204604) b!365912))

(assert (= (and b!365912 res!204602) b!365916))

(assert (= (and b!365916 res!204605) b!365907))

(assert (= (and b!365907 res!204607) b!365914))

(assert (= (and b!365914 res!204603) b!365913))

(assert (= (and b!365913 res!204608) b!365911))

(assert (= (and b!365909 condMapEmpty!14286) mapIsEmpty!14286))

(assert (= (and b!365909 (not condMapEmpty!14286)) mapNonEmpty!14286))

(get-info :version)

(assert (= (and mapNonEmpty!14286 ((_ is ValueCellFull!3900) mapValue!14286)) b!365906))

(assert (= (and b!365909 ((_ is ValueCellFull!3900) mapDefault!14286)) b!365910))

(assert (= start!36664 b!365909))

(declare-fun m!363435 () Bool)

(assert (=> b!365913 m!363435))

(declare-fun m!363437 () Bool)

(assert (=> b!365907 m!363437))

(declare-fun m!363439 () Bool)

(assert (=> b!365914 m!363439))

(declare-fun m!363441 () Bool)

(assert (=> start!36664 m!363441))

(declare-fun m!363443 () Bool)

(assert (=> start!36664 m!363443))

(declare-fun m!363445 () Bool)

(assert (=> start!36664 m!363445))

(declare-fun m!363447 () Bool)

(assert (=> b!365915 m!363447))

(declare-fun m!363449 () Bool)

(assert (=> mapNonEmpty!14286 m!363449))

(declare-fun m!363451 () Bool)

(assert (=> b!365912 m!363451))

(check-sat tp_is_empty!8487 (not mapNonEmpty!14286) (not b!365907) (not b!365915) (not start!36664) (not b!365913) (not b!365912))
(check-sat)
