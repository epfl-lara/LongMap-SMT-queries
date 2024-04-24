; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40362 () Bool)

(assert start!40362)

(declare-fun b!443629 () Bool)

(declare-fun res!262948 () Bool)

(declare-fun e!260991 () Bool)

(assert (=> b!443629 (=> (not res!262948) (not e!260991))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443629 (= res!262948 (validMask!0 mask!1025))))

(declare-fun b!443630 () Bool)

(declare-fun res!262951 () Bool)

(assert (=> b!443630 (=> (not res!262951) (not e!260991))))

(declare-datatypes ((array!27336 0))(
  ( (array!27337 (arr!13115 (Array (_ BitVec 32) (_ BitVec 64))) (size!13467 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27336)

(declare-datatypes ((List!7767 0))(
  ( (Nil!7764) (Cons!7763 (h!8619 (_ BitVec 64)) (t!13517 List!7767)) )
))
(declare-fun arrayNoDuplicates!0 (array!27336 (_ BitVec 32) List!7767) Bool)

(assert (=> b!443630 (= res!262951 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7764))))

(declare-fun b!443631 () Bool)

(declare-fun res!262949 () Bool)

(assert (=> b!443631 (=> (not res!262949) (not e!260991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27336 (_ BitVec 32)) Bool)

(assert (=> b!443631 (= res!262949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443632 () Bool)

(declare-fun res!262955 () Bool)

(assert (=> b!443632 (=> (not res!262955) (not e!260991))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443632 (= res!262955 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443633 () Bool)

(declare-fun e!260992 () Bool)

(declare-fun tp_is_empty!11761 () Bool)

(assert (=> b!443633 (= e!260992 tp_is_empty!11761)))

(declare-fun b!443634 () Bool)

(declare-fun e!260993 () Bool)

(assert (=> b!443634 (= e!260993 tp_is_empty!11761)))

(declare-fun b!443635 () Bool)

(declare-fun res!262957 () Bool)

(assert (=> b!443635 (=> (not res!262957) (not e!260991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443635 (= res!262957 (validKeyInArray!0 k0!794))))

(declare-fun b!443636 () Bool)

(declare-fun res!262954 () Bool)

(assert (=> b!443636 (=> (not res!262954) (not e!260991))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443636 (= res!262954 (or (= (select (arr!13115 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13115 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443637 () Bool)

(declare-fun res!262950 () Bool)

(assert (=> b!443637 (=> (not res!262950) (not e!260991))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16787 0))(
  ( (V!16788 (val!5925 Int)) )
))
(declare-datatypes ((ValueCell!5537 0))(
  ( (ValueCellFull!5537 (v!8177 V!16787)) (EmptyCell!5537) )
))
(declare-datatypes ((array!27338 0))(
  ( (array!27339 (arr!13116 (Array (_ BitVec 32) ValueCell!5537)) (size!13468 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27338)

(assert (=> b!443637 (= res!262950 (and (= (size!13468 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13467 _keys!709) (size!13468 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443638 () Bool)

(declare-fun e!260989 () Bool)

(declare-fun mapRes!19269 () Bool)

(assert (=> b!443638 (= e!260989 (and e!260992 mapRes!19269))))

(declare-fun condMapEmpty!19269 () Bool)

(declare-fun mapDefault!19269 () ValueCell!5537)

(assert (=> b!443638 (= condMapEmpty!19269 (= (arr!13116 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5537)) mapDefault!19269)))))

(declare-fun b!443639 () Bool)

(declare-fun res!262952 () Bool)

(assert (=> b!443639 (=> (not res!262952) (not e!260991))))

(assert (=> b!443639 (= res!262952 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13467 _keys!709))))))

(declare-fun res!262956 () Bool)

(assert (=> start!40362 (=> (not res!262956) (not e!260991))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40362 (= res!262956 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13467 _keys!709))))))

(assert (=> start!40362 e!260991))

(assert (=> start!40362 true))

(declare-fun array_inv!9586 (array!27338) Bool)

(assert (=> start!40362 (and (array_inv!9586 _values!549) e!260989)))

(declare-fun array_inv!9587 (array!27336) Bool)

(assert (=> start!40362 (array_inv!9587 _keys!709)))

(declare-fun mapIsEmpty!19269 () Bool)

(assert (=> mapIsEmpty!19269 mapRes!19269))

(declare-fun mapNonEmpty!19269 () Bool)

(declare-fun tp!37251 () Bool)

(assert (=> mapNonEmpty!19269 (= mapRes!19269 (and tp!37251 e!260993))))

(declare-fun mapKey!19269 () (_ BitVec 32))

(declare-fun mapValue!19269 () ValueCell!5537)

(declare-fun mapRest!19269 () (Array (_ BitVec 32) ValueCell!5537))

(assert (=> mapNonEmpty!19269 (= (arr!13116 _values!549) (store mapRest!19269 mapKey!19269 mapValue!19269))))

(declare-fun b!443640 () Bool)

(declare-fun e!260990 () Bool)

(assert (=> b!443640 (= e!260990 false)))

(declare-fun lt!203393 () Bool)

(declare-fun lt!203394 () array!27336)

(assert (=> b!443640 (= lt!203393 (arrayNoDuplicates!0 lt!203394 #b00000000000000000000000000000000 Nil!7764))))

(declare-fun b!443641 () Bool)

(assert (=> b!443641 (= e!260991 e!260990)))

(declare-fun res!262953 () Bool)

(assert (=> b!443641 (=> (not res!262953) (not e!260990))))

(assert (=> b!443641 (= res!262953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203394 mask!1025))))

(assert (=> b!443641 (= lt!203394 (array!27337 (store (arr!13115 _keys!709) i!563 k0!794) (size!13467 _keys!709)))))

(assert (= (and start!40362 res!262956) b!443629))

(assert (= (and b!443629 res!262948) b!443637))

(assert (= (and b!443637 res!262950) b!443631))

(assert (= (and b!443631 res!262949) b!443630))

(assert (= (and b!443630 res!262951) b!443639))

(assert (= (and b!443639 res!262952) b!443635))

(assert (= (and b!443635 res!262957) b!443636))

(assert (= (and b!443636 res!262954) b!443632))

(assert (= (and b!443632 res!262955) b!443641))

(assert (= (and b!443641 res!262953) b!443640))

(assert (= (and b!443638 condMapEmpty!19269) mapIsEmpty!19269))

(assert (= (and b!443638 (not condMapEmpty!19269)) mapNonEmpty!19269))

(get-info :version)

(assert (= (and mapNonEmpty!19269 ((_ is ValueCellFull!5537) mapValue!19269)) b!443634))

(assert (= (and b!443638 ((_ is ValueCellFull!5537) mapDefault!19269)) b!443633))

(assert (= start!40362 b!443638))

(declare-fun m!430071 () Bool)

(assert (=> b!443641 m!430071))

(declare-fun m!430073 () Bool)

(assert (=> b!443641 m!430073))

(declare-fun m!430075 () Bool)

(assert (=> b!443635 m!430075))

(declare-fun m!430077 () Bool)

(assert (=> mapNonEmpty!19269 m!430077))

(declare-fun m!430079 () Bool)

(assert (=> b!443632 m!430079))

(declare-fun m!430081 () Bool)

(assert (=> b!443629 m!430081))

(declare-fun m!430083 () Bool)

(assert (=> b!443630 m!430083))

(declare-fun m!430085 () Bool)

(assert (=> b!443631 m!430085))

(declare-fun m!430087 () Bool)

(assert (=> b!443636 m!430087))

(declare-fun m!430089 () Bool)

(assert (=> b!443640 m!430089))

(declare-fun m!430091 () Bool)

(assert (=> start!40362 m!430091))

(declare-fun m!430093 () Bool)

(assert (=> start!40362 m!430093))

(check-sat (not b!443631) (not b!443641) (not mapNonEmpty!19269) (not b!443640) (not b!443632) (not b!443630) (not b!443629) (not b!443635) (not start!40362) tp_is_empty!11761)
(check-sat)
