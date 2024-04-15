; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40312 () Bool)

(assert start!40312)

(declare-fun b!442646 () Bool)

(declare-fun e!260487 () Bool)

(declare-fun e!260483 () Bool)

(declare-fun mapRes!19212 () Bool)

(assert (=> b!442646 (= e!260487 (and e!260483 mapRes!19212))))

(declare-fun condMapEmpty!19212 () Bool)

(declare-datatypes ((V!16739 0))(
  ( (V!16740 (val!5907 Int)) )
))
(declare-datatypes ((ValueCell!5519 0))(
  ( (ValueCellFull!5519 (v!8152 V!16739)) (EmptyCell!5519) )
))
(declare-datatypes ((array!27261 0))(
  ( (array!27262 (arr!13079 (Array (_ BitVec 32) ValueCell!5519)) (size!13432 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27261)

(declare-fun mapDefault!19212 () ValueCell!5519)

(assert (=> b!442646 (= condMapEmpty!19212 (= (arr!13079 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5519)) mapDefault!19212)))))

(declare-fun res!262252 () Bool)

(declare-fun e!260484 () Bool)

(assert (=> start!40312 (=> (not res!262252) (not e!260484))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27263 0))(
  ( (array!27264 (arr!13080 (Array (_ BitVec 32) (_ BitVec 64))) (size!13433 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27263)

(assert (=> start!40312 (= res!262252 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13433 _keys!709))))))

(assert (=> start!40312 e!260484))

(assert (=> start!40312 true))

(declare-fun array_inv!9538 (array!27261) Bool)

(assert (=> start!40312 (and (array_inv!9538 _values!549) e!260487)))

(declare-fun array_inv!9539 (array!27263) Bool)

(assert (=> start!40312 (array_inv!9539 _keys!709)))

(declare-fun b!442647 () Bool)

(declare-fun e!260485 () Bool)

(assert (=> b!442647 (= e!260484 e!260485)))

(declare-fun res!262255 () Bool)

(assert (=> b!442647 (=> (not res!262255) (not e!260485))))

(declare-fun lt!203029 () array!27263)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27263 (_ BitVec 32)) Bool)

(assert (=> b!442647 (= res!262255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203029 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442647 (= lt!203029 (array!27264 (store (arr!13080 _keys!709) i!563 k0!794) (size!13433 _keys!709)))))

(declare-fun b!442648 () Bool)

(declare-fun res!262247 () Bool)

(assert (=> b!442648 (=> (not res!262247) (not e!260484))))

(assert (=> b!442648 (= res!262247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442649 () Bool)

(declare-fun res!262251 () Bool)

(assert (=> b!442649 (=> (not res!262251) (not e!260484))))

(declare-datatypes ((List!7848 0))(
  ( (Nil!7845) (Cons!7844 (h!8700 (_ BitVec 64)) (t!13597 List!7848)) )
))
(declare-fun arrayNoDuplicates!0 (array!27263 (_ BitVec 32) List!7848) Bool)

(assert (=> b!442649 (= res!262251 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7845))))

(declare-fun b!442650 () Bool)

(declare-fun res!262248 () Bool)

(assert (=> b!442650 (=> (not res!262248) (not e!260484))))

(assert (=> b!442650 (= res!262248 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13433 _keys!709))))))

(declare-fun b!442651 () Bool)

(declare-fun res!262254 () Bool)

(assert (=> b!442651 (=> (not res!262254) (not e!260484))))

(declare-fun arrayContainsKey!0 (array!27263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442651 (= res!262254 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442652 () Bool)

(declare-fun res!262250 () Bool)

(assert (=> b!442652 (=> (not res!262250) (not e!260484))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442652 (= res!262250 (and (= (size!13432 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13433 _keys!709) (size!13432 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442653 () Bool)

(declare-fun e!260488 () Bool)

(declare-fun tp_is_empty!11725 () Bool)

(assert (=> b!442653 (= e!260488 tp_is_empty!11725)))

(declare-fun b!442654 () Bool)

(assert (=> b!442654 (= e!260485 false)))

(declare-fun lt!203030 () Bool)

(assert (=> b!442654 (= lt!203030 (arrayNoDuplicates!0 lt!203029 #b00000000000000000000000000000000 Nil!7845))))

(declare-fun b!442655 () Bool)

(declare-fun res!262253 () Bool)

(assert (=> b!442655 (=> (not res!262253) (not e!260484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442655 (= res!262253 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19212 () Bool)

(assert (=> mapIsEmpty!19212 mapRes!19212))

(declare-fun mapNonEmpty!19212 () Bool)

(declare-fun tp!37194 () Bool)

(assert (=> mapNonEmpty!19212 (= mapRes!19212 (and tp!37194 e!260488))))

(declare-fun mapKey!19212 () (_ BitVec 32))

(declare-fun mapRest!19212 () (Array (_ BitVec 32) ValueCell!5519))

(declare-fun mapValue!19212 () ValueCell!5519)

(assert (=> mapNonEmpty!19212 (= (arr!13079 _values!549) (store mapRest!19212 mapKey!19212 mapValue!19212))))

(declare-fun b!442656 () Bool)

(assert (=> b!442656 (= e!260483 tp_is_empty!11725)))

(declare-fun b!442657 () Bool)

(declare-fun res!262249 () Bool)

(assert (=> b!442657 (=> (not res!262249) (not e!260484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442657 (= res!262249 (validMask!0 mask!1025))))

(declare-fun b!442658 () Bool)

(declare-fun res!262256 () Bool)

(assert (=> b!442658 (=> (not res!262256) (not e!260484))))

(assert (=> b!442658 (= res!262256 (or (= (select (arr!13080 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13080 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40312 res!262252) b!442657))

(assert (= (and b!442657 res!262249) b!442652))

(assert (= (and b!442652 res!262250) b!442648))

(assert (= (and b!442648 res!262247) b!442649))

(assert (= (and b!442649 res!262251) b!442650))

(assert (= (and b!442650 res!262248) b!442655))

(assert (= (and b!442655 res!262253) b!442658))

(assert (= (and b!442658 res!262256) b!442651))

(assert (= (and b!442651 res!262254) b!442647))

(assert (= (and b!442647 res!262255) b!442654))

(assert (= (and b!442646 condMapEmpty!19212) mapIsEmpty!19212))

(assert (= (and b!442646 (not condMapEmpty!19212)) mapNonEmpty!19212))

(get-info :version)

(assert (= (and mapNonEmpty!19212 ((_ is ValueCellFull!5519) mapValue!19212)) b!442653))

(assert (= (and b!442646 ((_ is ValueCellFull!5519) mapDefault!19212)) b!442656))

(assert (= start!40312 b!442646))

(declare-fun m!428653 () Bool)

(assert (=> b!442658 m!428653))

(declare-fun m!428655 () Bool)

(assert (=> b!442651 m!428655))

(declare-fun m!428657 () Bool)

(assert (=> b!442649 m!428657))

(declare-fun m!428659 () Bool)

(assert (=> b!442647 m!428659))

(declare-fun m!428661 () Bool)

(assert (=> b!442647 m!428661))

(declare-fun m!428663 () Bool)

(assert (=> b!442654 m!428663))

(declare-fun m!428665 () Bool)

(assert (=> b!442655 m!428665))

(declare-fun m!428667 () Bool)

(assert (=> start!40312 m!428667))

(declare-fun m!428669 () Bool)

(assert (=> start!40312 m!428669))

(declare-fun m!428671 () Bool)

(assert (=> b!442657 m!428671))

(declare-fun m!428673 () Bool)

(assert (=> mapNonEmpty!19212 m!428673))

(declare-fun m!428675 () Bool)

(assert (=> b!442648 m!428675))

(check-sat tp_is_empty!11725 (not b!442657) (not b!442654) (not mapNonEmpty!19212) (not b!442651) (not b!442647) (not b!442648) (not b!442655) (not b!442649) (not start!40312))
(check-sat)
