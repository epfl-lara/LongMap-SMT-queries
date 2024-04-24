; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39518 () Bool)

(assert start!39518)

(declare-fun b_free!9799 () Bool)

(declare-fun b_next!9799 () Bool)

(assert (=> start!39518 (= b_free!9799 (not b_next!9799))))

(declare-fun tp!34925 () Bool)

(declare-fun b_and!17469 () Bool)

(assert (=> start!39518 (= tp!34925 b_and!17469)))

(declare-fun b!422675 () Bool)

(declare-fun res!246904 () Bool)

(declare-fun e!251422 () Bool)

(assert (=> b!422675 (=> (not res!246904) (not e!251422))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422675 (= res!246904 (bvsle from!863 i!563))))

(declare-fun b!422676 () Bool)

(declare-fun res!246908 () Bool)

(declare-fun e!251420 () Bool)

(assert (=> b!422676 (=> (not res!246908) (not e!251420))))

(declare-datatypes ((array!25756 0))(
  ( (array!25757 (arr!12327 (Array (_ BitVec 32) (_ BitVec 64))) (size!12679 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25756)

(declare-datatypes ((List!7134 0))(
  ( (Nil!7131) (Cons!7130 (h!7986 (_ BitVec 64)) (t!12570 List!7134)) )
))
(declare-fun arrayNoDuplicates!0 (array!25756 (_ BitVec 32) List!7134) Bool)

(assert (=> b!422676 (= res!246908 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7131))))

(declare-fun b!422677 () Bool)

(declare-fun res!246912 () Bool)

(assert (=> b!422677 (=> (not res!246912) (not e!251420))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25756 (_ BitVec 32)) Bool)

(assert (=> b!422677 (= res!246912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422678 () Bool)

(declare-fun e!251418 () Bool)

(declare-fun tp_is_empty!10951 () Bool)

(assert (=> b!422678 (= e!251418 tp_is_empty!10951)))

(declare-fun b!422679 () Bool)

(declare-fun res!246901 () Bool)

(assert (=> b!422679 (=> (not res!246901) (not e!251420))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422679 (= res!246901 (validKeyInArray!0 k0!794))))

(declare-fun b!422680 () Bool)

(declare-fun res!246909 () Bool)

(assert (=> b!422680 (=> (not res!246909) (not e!251422))))

(declare-fun lt!194046 () array!25756)

(assert (=> b!422680 (= res!246909 (arrayNoDuplicates!0 lt!194046 #b00000000000000000000000000000000 Nil!7131))))

(declare-fun b!422681 () Bool)

(declare-fun res!246910 () Bool)

(assert (=> b!422681 (=> (not res!246910) (not e!251420))))

(declare-fun arrayContainsKey!0 (array!25756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422681 (= res!246910 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18048 () Bool)

(declare-fun mapRes!18048 () Bool)

(declare-fun tp!34926 () Bool)

(assert (=> mapNonEmpty!18048 (= mapRes!18048 (and tp!34926 e!251418))))

(declare-fun mapKey!18048 () (_ BitVec 32))

(declare-datatypes ((V!15707 0))(
  ( (V!15708 (val!5520 Int)) )
))
(declare-datatypes ((ValueCell!5132 0))(
  ( (ValueCellFull!5132 (v!7768 V!15707)) (EmptyCell!5132) )
))
(declare-datatypes ((array!25758 0))(
  ( (array!25759 (arr!12328 (Array (_ BitVec 32) ValueCell!5132)) (size!12680 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25758)

(declare-fun mapValue!18048 () ValueCell!5132)

(declare-fun mapRest!18048 () (Array (_ BitVec 32) ValueCell!5132))

(assert (=> mapNonEmpty!18048 (= (arr!12328 _values!549) (store mapRest!18048 mapKey!18048 mapValue!18048))))

(declare-fun b!422682 () Bool)

(assert (=> b!422682 (= e!251420 e!251422)))

(declare-fun res!246906 () Bool)

(assert (=> b!422682 (=> (not res!246906) (not e!251422))))

(assert (=> b!422682 (= res!246906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194046 mask!1025))))

(assert (=> b!422682 (= lt!194046 (array!25757 (store (arr!12327 _keys!709) i!563 k0!794) (size!12679 _keys!709)))))

(declare-fun b!422683 () Bool)

(declare-fun res!246905 () Bool)

(assert (=> b!422683 (=> (not res!246905) (not e!251420))))

(assert (=> b!422683 (= res!246905 (or (= (select (arr!12327 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12327 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!246911 () Bool)

(assert (=> start!39518 (=> (not res!246911) (not e!251420))))

(assert (=> start!39518 (= res!246911 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12679 _keys!709))))))

(assert (=> start!39518 e!251420))

(assert (=> start!39518 tp_is_empty!10951))

(assert (=> start!39518 tp!34925))

(assert (=> start!39518 true))

(declare-fun e!251419 () Bool)

(declare-fun array_inv!9058 (array!25758) Bool)

(assert (=> start!39518 (and (array_inv!9058 _values!549) e!251419)))

(declare-fun array_inv!9059 (array!25756) Bool)

(assert (=> start!39518 (array_inv!9059 _keys!709)))

(declare-fun mapIsEmpty!18048 () Bool)

(assert (=> mapIsEmpty!18048 mapRes!18048))

(declare-fun b!422684 () Bool)

(declare-fun res!246903 () Bool)

(assert (=> b!422684 (=> (not res!246903) (not e!251420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422684 (= res!246903 (validMask!0 mask!1025))))

(declare-fun b!422685 () Bool)

(declare-fun e!251421 () Bool)

(assert (=> b!422685 (= e!251421 tp_is_empty!10951)))

(declare-fun b!422686 () Bool)

(declare-fun res!246907 () Bool)

(assert (=> b!422686 (=> (not res!246907) (not e!251420))))

(assert (=> b!422686 (= res!246907 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12679 _keys!709))))))

(declare-fun b!422687 () Bool)

(assert (=> b!422687 (= e!251422 false)))

(declare-fun minValue!515 () V!15707)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15707)

(declare-datatypes ((tuple2!7132 0))(
  ( (tuple2!7133 (_1!3577 (_ BitVec 64)) (_2!3577 V!15707)) )
))
(declare-datatypes ((List!7135 0))(
  ( (Nil!7132) (Cons!7131 (h!7987 tuple2!7132) (t!12571 List!7135)) )
))
(declare-datatypes ((ListLongMap!6047 0))(
  ( (ListLongMap!6048 (toList!3039 List!7135)) )
))
(declare-fun lt!194044 () ListLongMap!6047)

(declare-fun v!412 () V!15707)

(declare-fun getCurrentListMapNoExtraKeys!1285 (array!25756 array!25758 (_ BitVec 32) (_ BitVec 32) V!15707 V!15707 (_ BitVec 32) Int) ListLongMap!6047)

(assert (=> b!422687 (= lt!194044 (getCurrentListMapNoExtraKeys!1285 lt!194046 (array!25759 (store (arr!12328 _values!549) i!563 (ValueCellFull!5132 v!412)) (size!12680 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194045 () ListLongMap!6047)

(assert (=> b!422687 (= lt!194045 (getCurrentListMapNoExtraKeys!1285 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422688 () Bool)

(declare-fun res!246902 () Bool)

(assert (=> b!422688 (=> (not res!246902) (not e!251420))))

(assert (=> b!422688 (= res!246902 (and (= (size!12680 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12679 _keys!709) (size!12680 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422689 () Bool)

(assert (=> b!422689 (= e!251419 (and e!251421 mapRes!18048))))

(declare-fun condMapEmpty!18048 () Bool)

(declare-fun mapDefault!18048 () ValueCell!5132)

(assert (=> b!422689 (= condMapEmpty!18048 (= (arr!12328 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5132)) mapDefault!18048)))))

(assert (= (and start!39518 res!246911) b!422684))

(assert (= (and b!422684 res!246903) b!422688))

(assert (= (and b!422688 res!246902) b!422677))

(assert (= (and b!422677 res!246912) b!422676))

(assert (= (and b!422676 res!246908) b!422686))

(assert (= (and b!422686 res!246907) b!422679))

(assert (= (and b!422679 res!246901) b!422683))

(assert (= (and b!422683 res!246905) b!422681))

(assert (= (and b!422681 res!246910) b!422682))

(assert (= (and b!422682 res!246906) b!422680))

(assert (= (and b!422680 res!246909) b!422675))

(assert (= (and b!422675 res!246904) b!422687))

(assert (= (and b!422689 condMapEmpty!18048) mapIsEmpty!18048))

(assert (= (and b!422689 (not condMapEmpty!18048)) mapNonEmpty!18048))

(get-info :version)

(assert (= (and mapNonEmpty!18048 ((_ is ValueCellFull!5132) mapValue!18048)) b!422678))

(assert (= (and b!422689 ((_ is ValueCellFull!5132) mapDefault!18048)) b!422685))

(assert (= start!39518 b!422689))

(declare-fun m!412661 () Bool)

(assert (=> b!422677 m!412661))

(declare-fun m!412663 () Bool)

(assert (=> b!422682 m!412663))

(declare-fun m!412665 () Bool)

(assert (=> b!422682 m!412665))

(declare-fun m!412667 () Bool)

(assert (=> b!422676 m!412667))

(declare-fun m!412669 () Bool)

(assert (=> b!422684 m!412669))

(declare-fun m!412671 () Bool)

(assert (=> b!422679 m!412671))

(declare-fun m!412673 () Bool)

(assert (=> b!422683 m!412673))

(declare-fun m!412675 () Bool)

(assert (=> start!39518 m!412675))

(declare-fun m!412677 () Bool)

(assert (=> start!39518 m!412677))

(declare-fun m!412679 () Bool)

(assert (=> b!422687 m!412679))

(declare-fun m!412681 () Bool)

(assert (=> b!422687 m!412681))

(declare-fun m!412683 () Bool)

(assert (=> b!422687 m!412683))

(declare-fun m!412685 () Bool)

(assert (=> b!422681 m!412685))

(declare-fun m!412687 () Bool)

(assert (=> b!422680 m!412687))

(declare-fun m!412689 () Bool)

(assert (=> mapNonEmpty!18048 m!412689))

(check-sat (not b!422676) (not b!422684) (not b!422680) (not start!39518) tp_is_empty!10951 (not b!422679) (not mapNonEmpty!18048) b_and!17469 (not b!422682) (not b!422681) (not b_next!9799) (not b!422677) (not b!422687))
(check-sat b_and!17469 (not b_next!9799))
