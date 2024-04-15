; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38234 () Bool)

(assert start!38234)

(declare-fun b!394380 () Bool)

(declare-fun e!238727 () Bool)

(declare-fun e!238724 () Bool)

(declare-fun mapRes!16236 () Bool)

(assert (=> b!394380 (= e!238727 (and e!238724 mapRes!16236))))

(declare-fun condMapEmpty!16236 () Bool)

(declare-datatypes ((V!14115 0))(
  ( (V!14116 (val!4923 Int)) )
))
(declare-datatypes ((ValueCell!4535 0))(
  ( (ValueCellFull!4535 (v!7162 V!14115)) (EmptyCell!4535) )
))
(declare-datatypes ((array!23407 0))(
  ( (array!23408 (arr!11160 (Array (_ BitVec 32) ValueCell!4535)) (size!11513 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23407)

(declare-fun mapDefault!16236 () ValueCell!4535)

(assert (=> b!394380 (= condMapEmpty!16236 (= (arr!11160 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4535)) mapDefault!16236)))))

(declare-fun b!394381 () Bool)

(declare-fun e!238726 () Bool)

(declare-fun tp_is_empty!9757 () Bool)

(assert (=> b!394381 (= e!238726 tp_is_empty!9757)))

(declare-fun b!394382 () Bool)

(assert (=> b!394382 (= e!238724 tp_is_empty!9757)))

(declare-fun res!226094 () Bool)

(declare-fun e!238725 () Bool)

(assert (=> start!38234 (=> (not res!226094) (not e!238725))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23409 0))(
  ( (array!23410 (arr!11161 (Array (_ BitVec 32) (_ BitVec 64))) (size!11514 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23409)

(assert (=> start!38234 (= res!226094 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11514 _keys!709))))))

(assert (=> start!38234 e!238725))

(assert (=> start!38234 true))

(declare-fun array_inv!8192 (array!23407) Bool)

(assert (=> start!38234 (and (array_inv!8192 _values!549) e!238727)))

(declare-fun array_inv!8193 (array!23409) Bool)

(assert (=> start!38234 (array_inv!8193 _keys!709)))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun b!394383 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394383 (= e!238725 (and (= (size!11513 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11514 _keys!709) (size!11513 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011) (= (size!11514 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)) (bvsgt #b00000000000000000000000000000000 (size!11514 _keys!709))))))

(declare-fun b!394384 () Bool)

(declare-fun res!226093 () Bool)

(assert (=> b!394384 (=> (not res!226093) (not e!238725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394384 (= res!226093 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16236 () Bool)

(assert (=> mapIsEmpty!16236 mapRes!16236))

(declare-fun mapNonEmpty!16236 () Bool)

(declare-fun tp!32031 () Bool)

(assert (=> mapNonEmpty!16236 (= mapRes!16236 (and tp!32031 e!238726))))

(declare-fun mapKey!16236 () (_ BitVec 32))

(declare-fun mapRest!16236 () (Array (_ BitVec 32) ValueCell!4535))

(declare-fun mapValue!16236 () ValueCell!4535)

(assert (=> mapNonEmpty!16236 (= (arr!11160 _values!549) (store mapRest!16236 mapKey!16236 mapValue!16236))))

(assert (= (and start!38234 res!226094) b!394384))

(assert (= (and b!394384 res!226093) b!394383))

(assert (= (and b!394380 condMapEmpty!16236) mapIsEmpty!16236))

(assert (= (and b!394380 (not condMapEmpty!16236)) mapNonEmpty!16236))

(get-info :version)

(assert (= (and mapNonEmpty!16236 ((_ is ValueCellFull!4535) mapValue!16236)) b!394381))

(assert (= (and b!394380 ((_ is ValueCellFull!4535) mapDefault!16236)) b!394382))

(assert (= start!38234 b!394380))

(declare-fun m!390339 () Bool)

(assert (=> start!38234 m!390339))

(declare-fun m!390341 () Bool)

(assert (=> start!38234 m!390341))

(declare-fun m!390343 () Bool)

(assert (=> b!394384 m!390343))

(declare-fun m!390345 () Bool)

(assert (=> mapNonEmpty!16236 m!390345))

(check-sat (not b!394384) (not start!38234) (not mapNonEmpty!16236) tp_is_empty!9757)
(check-sat)
