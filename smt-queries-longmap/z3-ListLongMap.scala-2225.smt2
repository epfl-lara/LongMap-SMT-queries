; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36798 () Bool)

(assert start!36798)

(declare-fun b_free!7939 () Bool)

(declare-fun b_next!7939 () Bool)

(assert (=> start!36798 (= b_free!7939 (not b_next!7939))))

(declare-fun tp!28532 () Bool)

(declare-fun b_and!15155 () Bool)

(assert (=> start!36798 (= tp!28532 b_and!15155)))

(declare-fun b!367579 () Bool)

(declare-fun res!205908 () Bool)

(declare-fun e!224891 () Bool)

(assert (=> b!367579 (=> (not res!205908) (not e!224891))))

(declare-datatypes ((array!21113 0))(
  ( (array!21114 (arr!10025 (Array (_ BitVec 32) (_ BitVec 64))) (size!10378 (_ BitVec 32))) )
))
(declare-fun lt!169205 () array!21113)

(declare-datatypes ((List!5545 0))(
  ( (Nil!5542) (Cons!5541 (h!6397 (_ BitVec 64)) (t!10686 List!5545)) )
))
(declare-fun arrayNoDuplicates!0 (array!21113 (_ BitVec 32) List!5545) Bool)

(assert (=> b!367579 (= res!205908 (arrayNoDuplicates!0 lt!169205 #b00000000000000000000000000000000 Nil!5542))))

(declare-fun b!367580 () Bool)

(declare-fun e!224888 () Bool)

(declare-fun tp_is_empty!8587 () Bool)

(assert (=> b!367580 (= e!224888 tp_is_empty!8587)))

(declare-fun b!367581 () Bool)

(declare-fun e!224890 () Bool)

(declare-fun e!224889 () Bool)

(declare-fun mapRes!14445 () Bool)

(assert (=> b!367581 (= e!224890 (and e!224889 mapRes!14445))))

(declare-fun condMapEmpty!14445 () Bool)

(declare-datatypes ((V!12555 0))(
  ( (V!12556 (val!4338 Int)) )
))
(declare-datatypes ((ValueCell!3950 0))(
  ( (ValueCellFull!3950 (v!6529 V!12555)) (EmptyCell!3950) )
))
(declare-datatypes ((array!21115 0))(
  ( (array!21116 (arr!10026 (Array (_ BitVec 32) ValueCell!3950)) (size!10379 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21115)

(declare-fun mapDefault!14445 () ValueCell!3950)

(assert (=> b!367581 (= condMapEmpty!14445 (= (arr!10026 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3950)) mapDefault!14445)))))

(declare-fun b!367582 () Bool)

(declare-fun e!224887 () Bool)

(assert (=> b!367582 (= e!224887 e!224891)))

(declare-fun res!205901 () Bool)

(assert (=> b!367582 (=> (not res!205901) (not e!224891))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21113 (_ BitVec 32)) Bool)

(assert (=> b!367582 (= res!205901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169205 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21113)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367582 (= lt!169205 (array!21114 (store (arr!10025 _keys!658) i!548 k0!778) (size!10378 _keys!658)))))

(declare-fun b!367583 () Bool)

(declare-fun res!205907 () Bool)

(assert (=> b!367583 (=> (not res!205907) (not e!224887))))

(assert (=> b!367583 (= res!205907 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5542))))

(declare-fun b!367584 () Bool)

(assert (=> b!367584 (= e!224889 tp_is_empty!8587)))

(declare-fun mapIsEmpty!14445 () Bool)

(assert (=> mapIsEmpty!14445 mapRes!14445))

(declare-fun b!367585 () Bool)

(declare-fun res!205904 () Bool)

(assert (=> b!367585 (=> (not res!205904) (not e!224887))))

(declare-fun arrayContainsKey!0 (array!21113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367585 (= res!205904 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367586 () Bool)

(declare-fun res!205903 () Bool)

(assert (=> b!367586 (=> (not res!205903) (not e!224887))))

(assert (=> b!367586 (= res!205903 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10378 _keys!658))))))

(declare-fun b!367587 () Bool)

(declare-fun res!205905 () Bool)

(assert (=> b!367587 (=> (not res!205905) (not e!224887))))

(assert (=> b!367587 (= res!205905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367588 () Bool)

(declare-fun res!205909 () Bool)

(assert (=> b!367588 (=> (not res!205909) (not e!224887))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367588 (= res!205909 (and (= (size!10379 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10378 _keys!658) (size!10379 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!205906 () Bool)

(assert (=> start!36798 (=> (not res!205906) (not e!224887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36798 (= res!205906 (validMask!0 mask!970))))

(assert (=> start!36798 e!224887))

(assert (=> start!36798 true))

(declare-fun array_inv!7430 (array!21115) Bool)

(assert (=> start!36798 (and (array_inv!7430 _values!506) e!224890)))

(assert (=> start!36798 tp!28532))

(assert (=> start!36798 tp_is_empty!8587))

(declare-fun array_inv!7431 (array!21113) Bool)

(assert (=> start!36798 (array_inv!7431 _keys!658)))

(declare-fun b!367589 () Bool)

(declare-fun res!205902 () Bool)

(assert (=> b!367589 (=> (not res!205902) (not e!224887))))

(assert (=> b!367589 (= res!205902 (or (= (select (arr!10025 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10025 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367590 () Bool)

(assert (=> b!367590 (= e!224891 false)))

(declare-datatypes ((tuple2!5716 0))(
  ( (tuple2!5717 (_1!2869 (_ BitVec 64)) (_2!2869 V!12555)) )
))
(declare-datatypes ((List!5546 0))(
  ( (Nil!5543) (Cons!5542 (h!6398 tuple2!5716) (t!10687 List!5546)) )
))
(declare-datatypes ((ListLongMap!4619 0))(
  ( (ListLongMap!4620 (toList!2325 List!5546)) )
))
(declare-fun lt!169206 () ListLongMap!4619)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12555)

(declare-fun minValue!472 () V!12555)

(declare-fun getCurrentListMapNoExtraKeys!616 (array!21113 array!21115 (_ BitVec 32) (_ BitVec 32) V!12555 V!12555 (_ BitVec 32) Int) ListLongMap!4619)

(assert (=> b!367590 (= lt!169206 (getCurrentListMapNoExtraKeys!616 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14445 () Bool)

(declare-fun tp!28533 () Bool)

(assert (=> mapNonEmpty!14445 (= mapRes!14445 (and tp!28533 e!224888))))

(declare-fun mapRest!14445 () (Array (_ BitVec 32) ValueCell!3950))

(declare-fun mapValue!14445 () ValueCell!3950)

(declare-fun mapKey!14445 () (_ BitVec 32))

(assert (=> mapNonEmpty!14445 (= (arr!10026 _values!506) (store mapRest!14445 mapKey!14445 mapValue!14445))))

(declare-fun b!367591 () Bool)

(declare-fun res!205910 () Bool)

(assert (=> b!367591 (=> (not res!205910) (not e!224887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367591 (= res!205910 (validKeyInArray!0 k0!778))))

(assert (= (and start!36798 res!205906) b!367588))

(assert (= (and b!367588 res!205909) b!367587))

(assert (= (and b!367587 res!205905) b!367583))

(assert (= (and b!367583 res!205907) b!367586))

(assert (= (and b!367586 res!205903) b!367591))

(assert (= (and b!367591 res!205910) b!367589))

(assert (= (and b!367589 res!205902) b!367585))

(assert (= (and b!367585 res!205904) b!367582))

(assert (= (and b!367582 res!205901) b!367579))

(assert (= (and b!367579 res!205908) b!367590))

(assert (= (and b!367581 condMapEmpty!14445) mapIsEmpty!14445))

(assert (= (and b!367581 (not condMapEmpty!14445)) mapNonEmpty!14445))

(get-info :version)

(assert (= (and mapNonEmpty!14445 ((_ is ValueCellFull!3950) mapValue!14445)) b!367580))

(assert (= (and b!367581 ((_ is ValueCellFull!3950) mapDefault!14445)) b!367584))

(assert (= start!36798 b!367581))

(declare-fun m!363965 () Bool)

(assert (=> b!367587 m!363965))

(declare-fun m!363967 () Bool)

(assert (=> b!367585 m!363967))

(declare-fun m!363969 () Bool)

(assert (=> b!367589 m!363969))

(declare-fun m!363971 () Bool)

(assert (=> b!367582 m!363971))

(declare-fun m!363973 () Bool)

(assert (=> b!367582 m!363973))

(declare-fun m!363975 () Bool)

(assert (=> start!36798 m!363975))

(declare-fun m!363977 () Bool)

(assert (=> start!36798 m!363977))

(declare-fun m!363979 () Bool)

(assert (=> start!36798 m!363979))

(declare-fun m!363981 () Bool)

(assert (=> mapNonEmpty!14445 m!363981))

(declare-fun m!363983 () Bool)

(assert (=> b!367590 m!363983))

(declare-fun m!363985 () Bool)

(assert (=> b!367591 m!363985))

(declare-fun m!363987 () Bool)

(assert (=> b!367583 m!363987))

(declare-fun m!363989 () Bool)

(assert (=> b!367579 m!363989))

(check-sat tp_is_empty!8587 (not b!367590) (not b!367585) b_and!15155 (not mapNonEmpty!14445) (not start!36798) (not b!367587) (not b!367582) (not b_next!7939) (not b!367591) (not b!367579) (not b!367583))
(check-sat b_and!15155 (not b_next!7939))
