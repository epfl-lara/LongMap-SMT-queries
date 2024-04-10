; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40576 () Bool)

(assert start!40576)

(declare-fun b_free!10587 () Bool)

(declare-fun b_next!10587 () Bool)

(assert (=> start!40576 (= b_free!10587 (not b_next!10587))))

(declare-fun tp!37580 () Bool)

(declare-fun b_and!18595 () Bool)

(assert (=> start!40576 (= tp!37580 b_and!18595)))

(declare-fun b!447377 () Bool)

(declare-fun res!265688 () Bool)

(declare-fun e!262701 () Bool)

(assert (=> b!447377 (=> (not res!265688) (not e!262701))))

(declare-datatypes ((array!27657 0))(
  ( (array!27658 (arr!13274 (Array (_ BitVec 32) (_ BitVec 64))) (size!13626 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27657)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447377 (= res!265688 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447378 () Bool)

(declare-fun e!262704 () Bool)

(declare-fun e!262702 () Bool)

(declare-fun mapRes!19521 () Bool)

(assert (=> b!447378 (= e!262704 (and e!262702 mapRes!19521))))

(declare-fun condMapEmpty!19521 () Bool)

(declare-datatypes ((V!17005 0))(
  ( (V!17006 (val!6007 Int)) )
))
(declare-datatypes ((ValueCell!5619 0))(
  ( (ValueCellFull!5619 (v!8262 V!17005)) (EmptyCell!5619) )
))
(declare-datatypes ((array!27659 0))(
  ( (array!27660 (arr!13275 (Array (_ BitVec 32) ValueCell!5619)) (size!13627 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27659)

(declare-fun mapDefault!19521 () ValueCell!5619)

(assert (=> b!447378 (= condMapEmpty!19521 (= (arr!13275 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5619)) mapDefault!19521)))))

(declare-fun b!447379 () Bool)

(declare-fun res!265686 () Bool)

(assert (=> b!447379 (=> (not res!265686) (not e!262701))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447379 (= res!265686 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13626 _keys!709))))))

(declare-fun b!447380 () Bool)

(declare-fun e!262705 () Bool)

(declare-fun tp_is_empty!11925 () Bool)

(assert (=> b!447380 (= e!262705 tp_is_empty!11925)))

(declare-fun b!447381 () Bool)

(declare-fun res!265684 () Bool)

(declare-fun e!262703 () Bool)

(assert (=> b!447381 (=> (not res!265684) (not e!262703))))

(declare-fun lt!203954 () array!27657)

(declare-datatypes ((List!7942 0))(
  ( (Nil!7939) (Cons!7938 (h!8794 (_ BitVec 64)) (t!13704 List!7942)) )
))
(declare-fun arrayNoDuplicates!0 (array!27657 (_ BitVec 32) List!7942) Bool)

(assert (=> b!447381 (= res!265684 (arrayNoDuplicates!0 lt!203954 #b00000000000000000000000000000000 Nil!7939))))

(declare-fun b!447382 () Bool)

(declare-fun res!265689 () Bool)

(assert (=> b!447382 (=> (not res!265689) (not e!262701))))

(assert (=> b!447382 (= res!265689 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7939))))

(declare-fun b!447383 () Bool)

(declare-fun res!265694 () Bool)

(assert (=> b!447383 (=> (not res!265694) (not e!262701))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!447383 (= res!265694 (and (= (size!13627 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13626 _keys!709) (size!13627 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19521 () Bool)

(assert (=> mapIsEmpty!19521 mapRes!19521))

(declare-fun b!447384 () Bool)

(declare-fun res!265687 () Bool)

(assert (=> b!447384 (=> (not res!265687) (not e!262701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27657 (_ BitVec 32)) Bool)

(assert (=> b!447384 (= res!265687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447385 () Bool)

(declare-fun res!265691 () Bool)

(assert (=> b!447385 (=> (not res!265691) (not e!262701))))

(assert (=> b!447385 (= res!265691 (or (= (select (arr!13274 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13274 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447386 () Bool)

(assert (=> b!447386 (= e!262702 tp_is_empty!11925)))

(declare-fun res!265695 () Bool)

(assert (=> start!40576 (=> (not res!265695) (not e!262701))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40576 (= res!265695 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13626 _keys!709))))))

(assert (=> start!40576 e!262701))

(assert (=> start!40576 tp_is_empty!11925))

(assert (=> start!40576 tp!37580))

(assert (=> start!40576 true))

(declare-fun array_inv!9626 (array!27659) Bool)

(assert (=> start!40576 (and (array_inv!9626 _values!549) e!262704)))

(declare-fun array_inv!9627 (array!27657) Bool)

(assert (=> start!40576 (array_inv!9627 _keys!709)))

(declare-fun b!447387 () Bool)

(declare-fun res!265693 () Bool)

(assert (=> b!447387 (=> (not res!265693) (not e!262701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447387 (= res!265693 (validKeyInArray!0 k0!794))))

(declare-fun b!447388 () Bool)

(assert (=> b!447388 (= e!262703 (and (= from!863 i!563) (or (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13626 _keys!709)))))))

(declare-fun minValue!515 () V!17005)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17005)

(declare-datatypes ((tuple2!7878 0))(
  ( (tuple2!7879 (_1!3950 (_ BitVec 64)) (_2!3950 V!17005)) )
))
(declare-datatypes ((List!7943 0))(
  ( (Nil!7940) (Cons!7939 (h!8795 tuple2!7878) (t!13705 List!7943)) )
))
(declare-datatypes ((ListLongMap!6791 0))(
  ( (ListLongMap!6792 (toList!3411 List!7943)) )
))
(declare-fun lt!203955 () ListLongMap!6791)

(declare-fun v!412 () V!17005)

(declare-fun getCurrentListMapNoExtraKeys!1597 (array!27657 array!27659 (_ BitVec 32) (_ BitVec 32) V!17005 V!17005 (_ BitVec 32) Int) ListLongMap!6791)

(assert (=> b!447388 (= lt!203955 (getCurrentListMapNoExtraKeys!1597 lt!203954 (array!27660 (store (arr!13275 _values!549) i!563 (ValueCellFull!5619 v!412)) (size!13627 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203953 () ListLongMap!6791)

(assert (=> b!447388 (= lt!203953 (getCurrentListMapNoExtraKeys!1597 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447389 () Bool)

(declare-fun res!265690 () Bool)

(assert (=> b!447389 (=> (not res!265690) (not e!262701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447389 (= res!265690 (validMask!0 mask!1025))))

(declare-fun b!447390 () Bool)

(declare-fun res!265685 () Bool)

(assert (=> b!447390 (=> (not res!265685) (not e!262703))))

(assert (=> b!447390 (= res!265685 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19521 () Bool)

(declare-fun tp!37581 () Bool)

(assert (=> mapNonEmpty!19521 (= mapRes!19521 (and tp!37581 e!262705))))

(declare-fun mapRest!19521 () (Array (_ BitVec 32) ValueCell!5619))

(declare-fun mapValue!19521 () ValueCell!5619)

(declare-fun mapKey!19521 () (_ BitVec 32))

(assert (=> mapNonEmpty!19521 (= (arr!13275 _values!549) (store mapRest!19521 mapKey!19521 mapValue!19521))))

(declare-fun b!447391 () Bool)

(assert (=> b!447391 (= e!262701 e!262703)))

(declare-fun res!265692 () Bool)

(assert (=> b!447391 (=> (not res!265692) (not e!262703))))

(assert (=> b!447391 (= res!265692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203954 mask!1025))))

(assert (=> b!447391 (= lt!203954 (array!27658 (store (arr!13274 _keys!709) i!563 k0!794) (size!13626 _keys!709)))))

(assert (= (and start!40576 res!265695) b!447389))

(assert (= (and b!447389 res!265690) b!447383))

(assert (= (and b!447383 res!265694) b!447384))

(assert (= (and b!447384 res!265687) b!447382))

(assert (= (and b!447382 res!265689) b!447379))

(assert (= (and b!447379 res!265686) b!447387))

(assert (= (and b!447387 res!265693) b!447385))

(assert (= (and b!447385 res!265691) b!447377))

(assert (= (and b!447377 res!265688) b!447391))

(assert (= (and b!447391 res!265692) b!447381))

(assert (= (and b!447381 res!265684) b!447390))

(assert (= (and b!447390 res!265685) b!447388))

(assert (= (and b!447378 condMapEmpty!19521) mapIsEmpty!19521))

(assert (= (and b!447378 (not condMapEmpty!19521)) mapNonEmpty!19521))

(get-info :version)

(assert (= (and mapNonEmpty!19521 ((_ is ValueCellFull!5619) mapValue!19521)) b!447380))

(assert (= (and b!447378 ((_ is ValueCellFull!5619) mapDefault!19521)) b!447386))

(assert (= start!40576 b!447378))

(declare-fun m!432283 () Bool)

(assert (=> b!447387 m!432283))

(declare-fun m!432285 () Bool)

(assert (=> start!40576 m!432285))

(declare-fun m!432287 () Bool)

(assert (=> start!40576 m!432287))

(declare-fun m!432289 () Bool)

(assert (=> b!447391 m!432289))

(declare-fun m!432291 () Bool)

(assert (=> b!447391 m!432291))

(declare-fun m!432293 () Bool)

(assert (=> b!447384 m!432293))

(declare-fun m!432295 () Bool)

(assert (=> b!447389 m!432295))

(declare-fun m!432297 () Bool)

(assert (=> b!447381 m!432297))

(declare-fun m!432299 () Bool)

(assert (=> b!447382 m!432299))

(declare-fun m!432301 () Bool)

(assert (=> mapNonEmpty!19521 m!432301))

(declare-fun m!432303 () Bool)

(assert (=> b!447385 m!432303))

(declare-fun m!432305 () Bool)

(assert (=> b!447377 m!432305))

(declare-fun m!432307 () Bool)

(assert (=> b!447388 m!432307))

(declare-fun m!432309 () Bool)

(assert (=> b!447388 m!432309))

(declare-fun m!432311 () Bool)

(assert (=> b!447388 m!432311))

(check-sat (not b!447384) (not b_next!10587) (not b!447377) (not mapNonEmpty!19521) (not b!447382) (not b!447381) (not b!447391) (not start!40576) (not b!447387) b_and!18595 tp_is_empty!11925 (not b!447389) (not b!447388))
(check-sat b_and!18595 (not b_next!10587))
