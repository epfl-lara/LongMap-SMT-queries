; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40378 () Bool)

(assert start!40378)

(declare-fun b!443717 () Bool)

(declare-fun res!262983 () Bool)

(declare-fun e!261043 () Bool)

(assert (=> b!443717 (=> (not res!262983) (not e!261043))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443717 (= res!262983 (validKeyInArray!0 k0!794))))

(declare-fun res!262982 () Bool)

(assert (=> start!40378 (=> (not res!262982) (not e!261043))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27335 0))(
  ( (array!27336 (arr!13115 (Array (_ BitVec 32) (_ BitVec 64))) (size!13467 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27335)

(assert (=> start!40378 (= res!262982 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13467 _keys!709))))))

(assert (=> start!40378 e!261043))

(assert (=> start!40378 true))

(declare-datatypes ((V!16789 0))(
  ( (V!16790 (val!5926 Int)) )
))
(declare-datatypes ((ValueCell!5538 0))(
  ( (ValueCellFull!5538 (v!8177 V!16789)) (EmptyCell!5538) )
))
(declare-datatypes ((array!27337 0))(
  ( (array!27338 (arr!13116 (Array (_ BitVec 32) ValueCell!5538)) (size!13468 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27337)

(declare-fun e!261042 () Bool)

(declare-fun array_inv!9514 (array!27337) Bool)

(assert (=> start!40378 (and (array_inv!9514 _values!549) e!261042)))

(declare-fun array_inv!9515 (array!27335) Bool)

(assert (=> start!40378 (array_inv!9515 _keys!709)))

(declare-fun b!443718 () Bool)

(declare-fun res!262988 () Bool)

(assert (=> b!443718 (=> (not res!262988) (not e!261043))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443718 (= res!262988 (and (= (size!13468 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13467 _keys!709) (size!13468 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443719 () Bool)

(declare-fun res!262981 () Bool)

(assert (=> b!443719 (=> (not res!262981) (not e!261043))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443719 (= res!262981 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13467 _keys!709))))))

(declare-fun b!443720 () Bool)

(declare-fun res!262985 () Bool)

(assert (=> b!443720 (=> (not res!262985) (not e!261043))))

(declare-fun arrayContainsKey!0 (array!27335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443720 (= res!262985 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443721 () Bool)

(declare-fun res!262986 () Bool)

(assert (=> b!443721 (=> (not res!262986) (not e!261043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27335 (_ BitVec 32)) Bool)

(assert (=> b!443721 (= res!262986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443722 () Bool)

(declare-fun e!261040 () Bool)

(declare-fun mapRes!19272 () Bool)

(assert (=> b!443722 (= e!261042 (and e!261040 mapRes!19272))))

(declare-fun condMapEmpty!19272 () Bool)

(declare-fun mapDefault!19272 () ValueCell!5538)

(assert (=> b!443722 (= condMapEmpty!19272 (= (arr!13116 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5538)) mapDefault!19272)))))

(declare-fun mapNonEmpty!19272 () Bool)

(declare-fun tp!37254 () Bool)

(declare-fun e!261044 () Bool)

(assert (=> mapNonEmpty!19272 (= mapRes!19272 (and tp!37254 e!261044))))

(declare-fun mapRest!19272 () (Array (_ BitVec 32) ValueCell!5538))

(declare-fun mapValue!19272 () ValueCell!5538)

(declare-fun mapKey!19272 () (_ BitVec 32))

(assert (=> mapNonEmpty!19272 (= (arr!13116 _values!549) (store mapRest!19272 mapKey!19272 mapValue!19272))))

(declare-fun b!443723 () Bool)

(declare-fun e!261039 () Bool)

(assert (=> b!443723 (= e!261039 false)))

(declare-fun lt!203381 () Bool)

(declare-fun lt!203380 () array!27335)

(declare-datatypes ((List!7860 0))(
  ( (Nil!7857) (Cons!7856 (h!8712 (_ BitVec 64)) (t!13618 List!7860)) )
))
(declare-fun arrayNoDuplicates!0 (array!27335 (_ BitVec 32) List!7860) Bool)

(assert (=> b!443723 (= lt!203381 (arrayNoDuplicates!0 lt!203380 #b00000000000000000000000000000000 Nil!7857))))

(declare-fun b!443724 () Bool)

(assert (=> b!443724 (= e!261043 e!261039)))

(declare-fun res!262989 () Bool)

(assert (=> b!443724 (=> (not res!262989) (not e!261039))))

(assert (=> b!443724 (= res!262989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203380 mask!1025))))

(assert (=> b!443724 (= lt!203380 (array!27336 (store (arr!13115 _keys!709) i!563 k0!794) (size!13467 _keys!709)))))

(declare-fun b!443725 () Bool)

(declare-fun res!262990 () Bool)

(assert (=> b!443725 (=> (not res!262990) (not e!261043))))

(assert (=> b!443725 (= res!262990 (or (= (select (arr!13115 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13115 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443726 () Bool)

(declare-fun tp_is_empty!11763 () Bool)

(assert (=> b!443726 (= e!261044 tp_is_empty!11763)))

(declare-fun b!443727 () Bool)

(declare-fun res!262987 () Bool)

(assert (=> b!443727 (=> (not res!262987) (not e!261043))))

(assert (=> b!443727 (= res!262987 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7857))))

(declare-fun b!443728 () Bool)

(declare-fun res!262984 () Bool)

(assert (=> b!443728 (=> (not res!262984) (not e!261043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443728 (= res!262984 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19272 () Bool)

(assert (=> mapIsEmpty!19272 mapRes!19272))

(declare-fun b!443729 () Bool)

(assert (=> b!443729 (= e!261040 tp_is_empty!11763)))

(assert (= (and start!40378 res!262982) b!443728))

(assert (= (and b!443728 res!262984) b!443718))

(assert (= (and b!443718 res!262988) b!443721))

(assert (= (and b!443721 res!262986) b!443727))

(assert (= (and b!443727 res!262987) b!443719))

(assert (= (and b!443719 res!262981) b!443717))

(assert (= (and b!443717 res!262983) b!443725))

(assert (= (and b!443725 res!262990) b!443720))

(assert (= (and b!443720 res!262985) b!443724))

(assert (= (and b!443724 res!262989) b!443723))

(assert (= (and b!443722 condMapEmpty!19272) mapIsEmpty!19272))

(assert (= (and b!443722 (not condMapEmpty!19272)) mapNonEmpty!19272))

(get-info :version)

(assert (= (and mapNonEmpty!19272 ((_ is ValueCellFull!5538) mapValue!19272)) b!443726))

(assert (= (and b!443722 ((_ is ValueCellFull!5538) mapDefault!19272)) b!443729))

(assert (= start!40378 b!443722))

(declare-fun m!429877 () Bool)

(assert (=> b!443728 m!429877))

(declare-fun m!429879 () Bool)

(assert (=> b!443725 m!429879))

(declare-fun m!429881 () Bool)

(assert (=> b!443727 m!429881))

(declare-fun m!429883 () Bool)

(assert (=> b!443724 m!429883))

(declare-fun m!429885 () Bool)

(assert (=> b!443724 m!429885))

(declare-fun m!429887 () Bool)

(assert (=> b!443723 m!429887))

(declare-fun m!429889 () Bool)

(assert (=> b!443717 m!429889))

(declare-fun m!429891 () Bool)

(assert (=> mapNonEmpty!19272 m!429891))

(declare-fun m!429893 () Bool)

(assert (=> b!443720 m!429893))

(declare-fun m!429895 () Bool)

(assert (=> b!443721 m!429895))

(declare-fun m!429897 () Bool)

(assert (=> start!40378 m!429897))

(declare-fun m!429899 () Bool)

(assert (=> start!40378 m!429899))

(check-sat (not start!40378) (not b!443717) (not mapNonEmpty!19272) tp_is_empty!11763 (not b!443728) (not b!443727) (not b!443721) (not b!443720) (not b!443723) (not b!443724))
(check-sat)
