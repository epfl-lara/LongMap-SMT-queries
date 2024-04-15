; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40428 () Bool)

(assert start!40428)

(declare-fun res!263816 () Bool)

(declare-fun e!261441 () Bool)

(assert (=> start!40428 (=> (not res!263816) (not e!261441))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27467 0))(
  ( (array!27468 (arr!13181 (Array (_ BitVec 32) (_ BitVec 64))) (size!13534 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27467)

(assert (=> start!40428 (= res!263816 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13534 _keys!709))))))

(assert (=> start!40428 e!261441))

(assert (=> start!40428 true))

(declare-datatypes ((V!16875 0))(
  ( (V!16876 (val!5958 Int)) )
))
(declare-datatypes ((ValueCell!5570 0))(
  ( (ValueCellFull!5570 (v!8203 V!16875)) (EmptyCell!5570) )
))
(declare-datatypes ((array!27469 0))(
  ( (array!27470 (arr!13182 (Array (_ BitVec 32) ValueCell!5570)) (size!13535 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27469)

(declare-fun e!261446 () Bool)

(declare-fun array_inv!9610 (array!27469) Bool)

(assert (=> start!40428 (and (array_inv!9610 _values!549) e!261446)))

(declare-fun array_inv!9611 (array!27467) Bool)

(assert (=> start!40428 (array_inv!9611 _keys!709)))

(declare-fun b!444694 () Bool)

(declare-fun res!263821 () Bool)

(assert (=> b!444694 (=> (not res!263821) (not e!261441))))

(declare-datatypes ((List!7888 0))(
  ( (Nil!7885) (Cons!7884 (h!8740 (_ BitVec 64)) (t!13637 List!7888)) )
))
(declare-fun arrayNoDuplicates!0 (array!27467 (_ BitVec 32) List!7888) Bool)

(assert (=> b!444694 (= res!263821 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7885))))

(declare-fun mapNonEmpty!19368 () Bool)

(declare-fun mapRes!19368 () Bool)

(declare-fun tp!37350 () Bool)

(declare-fun e!261444 () Bool)

(assert (=> mapNonEmpty!19368 (= mapRes!19368 (and tp!37350 e!261444))))

(declare-fun mapValue!19368 () ValueCell!5570)

(declare-fun mapKey!19368 () (_ BitVec 32))

(declare-fun mapRest!19368 () (Array (_ BitVec 32) ValueCell!5570))

(assert (=> mapNonEmpty!19368 (= (arr!13182 _values!549) (store mapRest!19368 mapKey!19368 mapValue!19368))))

(declare-fun b!444695 () Bool)

(declare-fun e!261445 () Bool)

(assert (=> b!444695 (= e!261445 false)))

(declare-fun lt!203339 () Bool)

(declare-fun lt!203338 () array!27467)

(assert (=> b!444695 (= lt!203339 (arrayNoDuplicates!0 lt!203338 #b00000000000000000000000000000000 Nil!7885))))

(declare-fun b!444696 () Bool)

(declare-fun e!261443 () Bool)

(declare-fun tp_is_empty!11827 () Bool)

(assert (=> b!444696 (= e!261443 tp_is_empty!11827)))

(declare-fun b!444697 () Bool)

(assert (=> b!444697 (= e!261446 (and e!261443 mapRes!19368))))

(declare-fun condMapEmpty!19368 () Bool)

(declare-fun mapDefault!19368 () ValueCell!5570)

(assert (=> b!444697 (= condMapEmpty!19368 (= (arr!13182 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5570)) mapDefault!19368)))))

(declare-fun b!444698 () Bool)

(declare-fun res!263818 () Bool)

(assert (=> b!444698 (=> (not res!263818) (not e!261441))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27467 (_ BitVec 32)) Bool)

(assert (=> b!444698 (= res!263818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444699 () Bool)

(declare-fun res!263817 () Bool)

(assert (=> b!444699 (=> (not res!263817) (not e!261441))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444699 (= res!263817 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13534 _keys!709))))))

(declare-fun mapIsEmpty!19368 () Bool)

(assert (=> mapIsEmpty!19368 mapRes!19368))

(declare-fun b!444700 () Bool)

(declare-fun res!263819 () Bool)

(assert (=> b!444700 (=> (not res!263819) (not e!261441))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444700 (= res!263819 (and (= (size!13535 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13534 _keys!709) (size!13535 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444701 () Bool)

(assert (=> b!444701 (= e!261441 e!261445)))

(declare-fun res!263813 () Bool)

(assert (=> b!444701 (=> (not res!263813) (not e!261445))))

(assert (=> b!444701 (= res!263813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203338 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!444701 (= lt!203338 (array!27468 (store (arr!13181 _keys!709) i!563 k0!794) (size!13534 _keys!709)))))

(declare-fun b!444702 () Bool)

(declare-fun res!263815 () Bool)

(assert (=> b!444702 (=> (not res!263815) (not e!261441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444702 (= res!263815 (validKeyInArray!0 k0!794))))

(declare-fun b!444703 () Bool)

(declare-fun res!263820 () Bool)

(assert (=> b!444703 (=> (not res!263820) (not e!261441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444703 (= res!263820 (validMask!0 mask!1025))))

(declare-fun b!444704 () Bool)

(declare-fun res!263814 () Bool)

(assert (=> b!444704 (=> (not res!263814) (not e!261441))))

(declare-fun arrayContainsKey!0 (array!27467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444704 (= res!263814 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444705 () Bool)

(assert (=> b!444705 (= e!261444 tp_is_empty!11827)))

(declare-fun b!444706 () Bool)

(declare-fun res!263812 () Bool)

(assert (=> b!444706 (=> (not res!263812) (not e!261441))))

(assert (=> b!444706 (= res!263812 (or (= (select (arr!13181 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13181 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40428 res!263816) b!444703))

(assert (= (and b!444703 res!263820) b!444700))

(assert (= (and b!444700 res!263819) b!444698))

(assert (= (and b!444698 res!263818) b!444694))

(assert (= (and b!444694 res!263821) b!444699))

(assert (= (and b!444699 res!263817) b!444702))

(assert (= (and b!444702 res!263815) b!444706))

(assert (= (and b!444706 res!263812) b!444704))

(assert (= (and b!444704 res!263814) b!444701))

(assert (= (and b!444701 res!263813) b!444695))

(assert (= (and b!444697 condMapEmpty!19368) mapIsEmpty!19368))

(assert (= (and b!444697 (not condMapEmpty!19368)) mapNonEmpty!19368))

(get-info :version)

(assert (= (and mapNonEmpty!19368 ((_ is ValueCellFull!5570) mapValue!19368)) b!444705))

(assert (= (and b!444697 ((_ is ValueCellFull!5570) mapDefault!19368)) b!444696))

(assert (= start!40428 b!444697))

(declare-fun m!429913 () Bool)

(assert (=> b!444701 m!429913))

(declare-fun m!429915 () Bool)

(assert (=> b!444701 m!429915))

(declare-fun m!429917 () Bool)

(assert (=> b!444704 m!429917))

(declare-fun m!429919 () Bool)

(assert (=> start!40428 m!429919))

(declare-fun m!429921 () Bool)

(assert (=> start!40428 m!429921))

(declare-fun m!429923 () Bool)

(assert (=> b!444706 m!429923))

(declare-fun m!429925 () Bool)

(assert (=> b!444703 m!429925))

(declare-fun m!429927 () Bool)

(assert (=> b!444702 m!429927))

(declare-fun m!429929 () Bool)

(assert (=> b!444695 m!429929))

(declare-fun m!429931 () Bool)

(assert (=> b!444694 m!429931))

(declare-fun m!429933 () Bool)

(assert (=> b!444698 m!429933))

(declare-fun m!429935 () Bool)

(assert (=> mapNonEmpty!19368 m!429935))

(check-sat (not b!444703) (not b!444704) (not b!444702) (not b!444698) tp_is_empty!11827 (not mapNonEmpty!19368) (not b!444701) (not b!444695) (not b!444694) (not start!40428))
(check-sat)
